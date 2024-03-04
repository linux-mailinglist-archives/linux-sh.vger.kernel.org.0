Return-Path: <linux-sh+bounces-503-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6074486FF89
	for <lists+linux-sh@lfdr.de>; Mon,  4 Mar 2024 11:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86CB286608
	for <lists+linux-sh@lfdr.de>; Mon,  4 Mar 2024 10:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF8C376F9;
	Mon,  4 Mar 2024 10:52:58 +0000 (UTC)
X-Original-To: linux-sh@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9B738FA7
	for <linux-sh@vger.kernel.org>; Mon,  4 Mar 2024 10:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709549578; cv=none; b=qRXyYLOg/TJATuS7urgYiYt4RPgV4H9ckvBkM42EGrm/WBc3nZyGTF2MPuy7ZX1QgkLf6YKMjpUdenJSOJA0CCauweBypog4njlkQGW+EVrTorwgABOdWzVpdaxAtnskOZrOpkppKNbG2BTsEWkxqsZkK/gOTVGpNP7+jh8cDe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709549578; c=relaxed/simple;
	bh=9N9TwjMngBZnXAXPp5PTUV+eUQQxx5zCHEG3Uth6spo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o5wuYjTxe205972t+vnAC2FAeEnHLXOnSyLt9a1ge5Ki2N+ckO3jEseTJEdqfOlkDd0DmIgw2HZD31DW9exSMsEnooIMP45Y8OBdiixVfTON5r15lCok+ZEYtXwatnvRbbQxH/hPy4178qN7vpb7o6nCsxj4NPfwZBX9L4VWzvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2716:1247:52e8:4f90])
	by xavier.telenet-ops.be with bizsmtp
	id uasm2B00B2qflky01asm1s; Mon, 04 Mar 2024 11:52:46 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rh5vu-002I67-G5;
	Mon, 04 Mar 2024 11:52:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rh5w6-007KKH-4u;
	Mon, 04 Mar 2024 11:52:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] serial: sh-sci: Call sci_serial_{in,out}() directly
Date: Mon,  4 Mar 2024 11:52:44 +0100
Message-Id: <51e79d601cb9d9d63822d3773d3cf05a96868612.1709548811.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike the 8250 serial driver complex, the sh-sci driver uses only a
single pair of functions to read and write serial port registers.
Hence there is no need to incur the overhead of calling them through
indirection, like the serial_port_{in,out}() wrappers do.

Replace all calls to these wrappers by direct calls to
sci_serial_{in,out}().

Remove the setup of the uart_port.serial_{in,out}() callbacks.  After
removal of all calls to serial_port_{in,out}() in the sh-sci driver, the
only remaining user is uart_xchar_out(), which the sh-sci driver does
not use.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on R-Car Gen2/3, RZ/Five, and SH7751.
---
 drivers/tty/serial/sh-sci.c | 245 ++++++++++++++++++------------------
 1 file changed, 119 insertions(+), 126 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index a85e7b9a2e492391..fd6b941d66266fe8 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -576,13 +576,13 @@ static void sci_start_tx(struct uart_port *port)
 
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
 	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
-		u16 new, scr = serial_port_in(port, SCSCR);
+		u16 new, scr = sci_serial_in(port, SCSCR);
 		if (s->chan_tx)
 			new = scr | SCSCR_TDRQE;
 		else
 			new = scr & ~SCSCR_TDRQE;
 		if (new != scr)
-			serial_port_out(port, SCSCR, new);
+			sci_serial_out(port, SCSCR, new);
 	}
 
 	if (s->chan_tx && !uart_circ_empty(&s->port.state->xmit) &&
@@ -599,7 +599,7 @@ static void sci_start_tx(struct uart_port *port)
 	if (!s->chan_tx || s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE ||
 	    port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
 		/* Set TIE (Transmit Interrupt Enable) bit in SCSCR */
-		ctrl = serial_port_in(port, SCSCR);
+		ctrl = sci_serial_in(port, SCSCR);
 
 		/*
 		 * For SCI, TE (transmit enable) must be set after setting TIE
@@ -609,7 +609,7 @@ static void sci_start_tx(struct uart_port *port)
 		if (port->type == PORT_SCI)
 			ctrl |= SCSCR_TE;
 
-		serial_port_out(port, SCSCR, ctrl | SCSCR_TIE);
+		sci_serial_out(port, SCSCR, ctrl | SCSCR_TIE);
 	}
 }
 
@@ -618,14 +618,14 @@ static void sci_stop_tx(struct uart_port *port)
 	unsigned short ctrl;
 
 	/* Clear TIE (Transmit Interrupt Enable) bit in SCSCR */
-	ctrl = serial_port_in(port, SCSCR);
+	ctrl = sci_serial_in(port, SCSCR);
 
 	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
 		ctrl &= ~SCSCR_TDRQE;
 
 	ctrl &= ~SCSCR_TIE;
 
-	serial_port_out(port, SCSCR, ctrl);
+	sci_serial_out(port, SCSCR, ctrl);
 
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
 	if (to_sci_port(port)->chan_tx &&
@@ -640,41 +640,40 @@ static void sci_start_rx(struct uart_port *port)
 {
 	unsigned short ctrl;
 
-	ctrl = serial_port_in(port, SCSCR) | port_rx_irq_mask(port);
+	ctrl = sci_serial_in(port, SCSCR) | port_rx_irq_mask(port);
 
 	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
 		ctrl &= ~SCSCR_RDRQE;
 
-	serial_port_out(port, SCSCR, ctrl);
+	sci_serial_out(port, SCSCR, ctrl);
 }
 
 static void sci_stop_rx(struct uart_port *port)
 {
 	unsigned short ctrl;
 
-	ctrl = serial_port_in(port, SCSCR);
+	ctrl = sci_serial_in(port, SCSCR);
 
 	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
 		ctrl &= ~SCSCR_RDRQE;
 
 	ctrl &= ~port_rx_irq_mask(port);
 
-	serial_port_out(port, SCSCR, ctrl);
+	sci_serial_out(port, SCSCR, ctrl);
 }
 
 static void sci_clear_SCxSR(struct uart_port *port, unsigned int mask)
 {
 	if (port->type == PORT_SCI) {
 		/* Just store the mask */
-		serial_port_out(port, SCxSR, mask);
+		sci_serial_out(port, SCxSR, mask);
 	} else if (to_sci_port(port)->params->overrun_mask == SCIFA_ORER) {
 		/* SCIFA/SCIFB and SCIF on SH7705/SH7720/SH7721 */
 		/* Only clear the status bits we want to clear */
-		serial_port_out(port, SCxSR,
-				serial_port_in(port, SCxSR) & mask);
+		sci_serial_out(port, SCxSR, sci_serial_in(port, SCxSR) & mask);
 	} else {
 		/* Store the mask, clear parity/framing errors */
-		serial_port_out(port, SCxSR, mask & ~(SCIF_FERC | SCIF_PERC));
+		sci_serial_out(port, SCxSR, mask & ~(SCIF_FERC | SCIF_PERC));
 	}
 }
 
@@ -688,7 +687,7 @@ static int sci_poll_get_char(struct uart_port *port)
 	int c;
 
 	do {
-		status = serial_port_in(port, SCxSR);
+		status = sci_serial_in(port, SCxSR);
 		if (status & SCxSR_ERRORS(port)) {
 			sci_clear_SCxSR(port, SCxSR_ERROR_CLEAR(port));
 			continue;
@@ -699,10 +698,10 @@ static int sci_poll_get_char(struct uart_port *port)
 	if (!(status & SCxSR_RDxF(port)))
 		return NO_POLL_CHAR;
 
-	c = serial_port_in(port, SCxRDR);
+	c = sci_serial_in(port, SCxRDR);
 
 	/* Dummy read */
-	serial_port_in(port, SCxSR);
+	sci_serial_in(port, SCxSR);
 	sci_clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
 
 	return c;
@@ -714,10 +713,10 @@ static void sci_poll_put_char(struct uart_port *port, unsigned char c)
 	unsigned short status;
 
 	do {
-		status = serial_port_in(port, SCxSR);
+		status = sci_serial_in(port, SCxSR);
 	} while (!(status & SCxSR_TDxE(port)));
 
-	serial_port_out(port, SCxTDR, c);
+	sci_serial_out(port, SCxTDR, c);
 	sci_clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
 }
 #endif /* CONFIG_CONSOLE_POLL || CONFIG_SERIAL_SH_SCI_CONSOLE ||
@@ -736,8 +735,8 @@ static void sci_init_pins(struct uart_port *port, unsigned int cflag)
 	}
 
 	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
-		u16 data = serial_port_in(port, SCPDR);
-		u16 ctrl = serial_port_in(port, SCPCR);
+		u16 data = sci_serial_in(port, SCPDR);
+		u16 ctrl = sci_serial_in(port, SCPCR);
 
 		/* Enable RXD and TXD pin functions */
 		ctrl &= ~(SCPCR_RXDC | SCPCR_TXDC);
@@ -756,10 +755,10 @@ static void sci_init_pins(struct uart_port *port, unsigned int cflag)
 			/* Enable CTS# pin function */
 			ctrl &= ~SCPCR_CTSC;
 		}
-		serial_port_out(port, SCPDR, data);
-		serial_port_out(port, SCPCR, ctrl);
+		sci_serial_out(port, SCPDR, data);
+		sci_serial_out(port, SCPCR, ctrl);
 	} else if (sci_getreg(port, SCSPTR)->size) {
-		u16 status = serial_port_in(port, SCSPTR);
+		u16 status = sci_serial_in(port, SCSPTR);
 
 		/* RTS# is always output; and active low, unless autorts */
 		status |= SCSPTR_RTSIO;
@@ -769,7 +768,7 @@ static void sci_init_pins(struct uart_port *port, unsigned int cflag)
 			status &= ~SCSPTR_RTSDT;
 		/* CTS# and SCK are inputs */
 		status &= ~(SCSPTR_CTSIO | SCSPTR_SCKIO);
-		serial_port_out(port, SCSPTR, status);
+		sci_serial_out(port, SCSPTR, status);
 	}
 }
 
@@ -781,13 +780,13 @@ static int sci_txfill(struct uart_port *port)
 
 	reg = sci_getreg(port, SCTFDR);
 	if (reg->size)
-		return serial_port_in(port, SCTFDR) & fifo_mask;
+		return sci_serial_in(port, SCTFDR) & fifo_mask;
 
 	reg = sci_getreg(port, SCFDR);
 	if (reg->size)
-		return serial_port_in(port, SCFDR) >> 8;
+		return sci_serial_in(port, SCFDR) >> 8;
 
-	return !(serial_port_in(port, SCxSR) & SCI_TDRE);
+	return !(sci_serial_in(port, SCxSR) & SCI_TDRE);
 }
 
 static int sci_txroom(struct uart_port *port)
@@ -803,13 +802,13 @@ static int sci_rxfill(struct uart_port *port)
 
 	reg = sci_getreg(port, SCRFDR);
 	if (reg->size)
-		return serial_port_in(port, SCRFDR) & fifo_mask;
+		return sci_serial_in(port, SCRFDR) & fifo_mask;
 
 	reg = sci_getreg(port, SCFDR);
 	if (reg->size)
-		return serial_port_in(port, SCFDR) & fifo_mask;
+		return sci_serial_in(port, SCFDR) & fifo_mask;
 
-	return (serial_port_in(port, SCxSR) & SCxSR_RDxF(port)) != 0;
+	return (sci_serial_in(port, SCxSR) & SCxSR_RDxF(port)) != 0;
 }
 
 /* ********************************************************************** *
@@ -824,14 +823,14 @@ static void sci_transmit_chars(struct uart_port *port)
 	unsigned short ctrl;
 	int count;
 
-	status = serial_port_in(port, SCxSR);
+	status = sci_serial_in(port, SCxSR);
 	if (!(status & SCxSR_TDxE(port))) {
-		ctrl = serial_port_in(port, SCSCR);
+		ctrl = sci_serial_in(port, SCSCR);
 		if (uart_circ_empty(xmit))
 			ctrl &= ~SCSCR_TIE;
 		else
 			ctrl |= SCSCR_TIE;
-		serial_port_out(port, SCSCR, ctrl);
+		sci_serial_out(port, SCSCR, ctrl);
 		return;
 	}
 
@@ -847,15 +846,15 @@ static void sci_transmit_chars(struct uart_port *port)
 			c = xmit->buf[xmit->tail];
 			xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
 		} else if (port->type == PORT_SCI && uart_circ_empty(xmit)) {
-			ctrl = serial_port_in(port, SCSCR);
+			ctrl = sci_serial_in(port, SCSCR);
 			ctrl &= ~SCSCR_TE;
-			serial_port_out(port, SCSCR, ctrl);
+			sci_serial_out(port, SCSCR, ctrl);
 			return;
 		} else {
 			break;
 		}
 
-		serial_port_out(port, SCxTDR, c);
+		sci_serial_out(port, SCxTDR, c);
 
 		port->icount.tx++;
 	} while (--count > 0);
@@ -866,10 +865,10 @@ static void sci_transmit_chars(struct uart_port *port)
 		uart_write_wakeup(port);
 	if (uart_circ_empty(xmit)) {
 		if (port->type == PORT_SCI) {
-			ctrl = serial_port_in(port, SCSCR);
+			ctrl = sci_serial_in(port, SCSCR);
 			ctrl &= ~SCSCR_TIE;
 			ctrl |= SCSCR_TEIE;
-			serial_port_out(port, SCSCR, ctrl);
+			sci_serial_out(port, SCSCR, ctrl);
 		}
 
 		sci_stop_tx(port);
@@ -883,7 +882,7 @@ static void sci_receive_chars(struct uart_port *port)
 	unsigned short status;
 	unsigned char flag;
 
-	status = serial_port_in(port, SCxSR);
+	status = sci_serial_in(port, SCxSR);
 	if (!(status & SCxSR_RDxF(port)))
 		return;
 
@@ -896,7 +895,7 @@ static void sci_receive_chars(struct uart_port *port)
 			break;
 
 		if (port->type == PORT_SCI) {
-			char c = serial_port_in(port, SCxRDR);
+			char c = sci_serial_in(port, SCxRDR);
 			if (uart_handle_sysrq_char(port, c))
 				count = 0;
 			else
@@ -907,11 +906,11 @@ static void sci_receive_chars(struct uart_port *port)
 
 				if (port->type == PORT_SCIF ||
 				    port->type == PORT_HSCIF) {
-					status = serial_port_in(port, SCxSR);
-					c = serial_port_in(port, SCxRDR);
+					status = sci_serial_in(port, SCxSR);
+					c = sci_serial_in(port, SCxRDR);
 				} else {
-					c = serial_port_in(port, SCxRDR);
-					status = serial_port_in(port, SCxSR);
+					c = sci_serial_in(port, SCxRDR);
+					status = sci_serial_in(port, SCxSR);
 				}
 				if (uart_handle_sysrq_char(port, c)) {
 					count--; i--;
@@ -932,7 +931,7 @@ static void sci_receive_chars(struct uart_port *port)
 			}
 		}
 
-		serial_port_in(port, SCxSR); /* dummy read */
+		sci_serial_in(port, SCxSR); /* dummy read */
 		sci_clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
 
 		copied += count;
@@ -944,8 +943,8 @@ static void sci_receive_chars(struct uart_port *port)
 		tty_flip_buffer_push(tport);
 	} else {
 		/* TTY buffers full; read from RX reg to prevent lockup */
-		serial_port_in(port, SCxRDR);
-		serial_port_in(port, SCxSR); /* dummy read */
+		sci_serial_in(port, SCxRDR);
+		sci_serial_in(port, SCxSR); /* dummy read */
 		sci_clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
 	}
 }
@@ -953,7 +952,7 @@ static void sci_receive_chars(struct uart_port *port)
 static int sci_handle_errors(struct uart_port *port)
 {
 	int copied = 0;
-	unsigned short status = serial_port_in(port, SCxSR);
+	unsigned short status = sci_serial_in(port, SCxSR);
 	struct tty_port *tport = &port->state->port;
 	struct sci_port *s = to_sci_port(port);
 
@@ -1000,10 +999,10 @@ static int sci_handle_fifo_overrun(struct uart_port *port)
 	if (!reg->size)
 		return 0;
 
-	status = serial_port_in(port, s->params->overrun_reg);
+	status = sci_serial_in(port, s->params->overrun_reg);
 	if (status & s->params->overrun_mask) {
 		status &= ~s->params->overrun_mask;
-		serial_port_out(port, s->params->overrun_reg, status);
+		sci_serial_out(port, s->params->overrun_reg, status);
 
 		port->icount.overrun++;
 
@@ -1018,7 +1017,7 @@ static int sci_handle_fifo_overrun(struct uart_port *port)
 static int sci_handle_breaks(struct uart_port *port)
 {
 	int copied = 0;
-	unsigned short status = serial_port_in(port, SCxSR);
+	unsigned short status = sci_serial_in(port, SCxSR);
 	struct tty_port *tport = &port->state->port;
 
 	if (uart_handle_break(port))
@@ -1051,7 +1050,7 @@ static int scif_set_rtrg(struct uart_port *port, int rx_trig)
 
 	/* HSCIF can be set to an arbitrary level. */
 	if (sci_getreg(port, HSRTRGR)->size) {
-		serial_port_out(port, HSRTRGR, rx_trig);
+		sci_serial_out(port, HSRTRGR, rx_trig);
 		return rx_trig;
 	}
 
@@ -1092,9 +1091,9 @@ static int scif_set_rtrg(struct uart_port *port, int rx_trig)
 		return 1;
 	}
 
-	serial_port_out(port, SCFCR,
-		(serial_port_in(port, SCFCR) &
-		~(SCFCR_RTRG1 | SCFCR_RTRG0)) | bits);
+	sci_serial_out(port, SCFCR,
+		       (sci_serial_in(port, SCFCR) &
+			~(SCFCR_RTRG1 | SCFCR_RTRG0)) | bits);
 
 	return rx_trig;
 }
@@ -1102,9 +1101,9 @@ static int scif_set_rtrg(struct uart_port *port, int rx_trig)
 static int scif_rtrg_enabled(struct uart_port *port)
 {
 	if (sci_getreg(port, HSRTRGR)->size)
-		return serial_port_in(port, HSRTRGR) != 0;
+		return sci_serial_in(port, HSRTRGR) != 0;
 	else
-		return (serial_port_in(port, SCFCR) &
+		return (sci_serial_in(port, SCFCR) &
 			(SCFCR_RTRG0 | SCFCR_RTRG1)) != 0;
 }
 
@@ -1219,8 +1218,8 @@ static void sci_dma_tx_complete(void *arg)
 		s->cookie_tx = -EINVAL;
 		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
 		    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
-			u16 ctrl = serial_port_in(port, SCSCR);
-			serial_port_out(port, SCSCR, ctrl & ~SCSCR_TIE);
+			u16 ctrl = sci_serial_in(port, SCSCR);
+			sci_serial_out(port, SCSCR, ctrl & ~SCSCR_TIE);
 			if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 				/* Switch irq from DMA to SCIF */
 				dmaengine_pause(s->chan_tx_saved);
@@ -1296,7 +1295,7 @@ static void sci_dma_rx_reenable_irq(struct sci_port *s)
 	u16 scr;
 
 	/* Direct new serial port interrupts back to CPU */
-	scr = serial_port_in(port, SCSCR);
+	scr = sci_serial_in(port, SCSCR);
 	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
 	    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 		enable_irq(s->irqs[SCIx_RXI_IRQ]);
@@ -1305,7 +1304,7 @@ static void sci_dma_rx_reenable_irq(struct sci_port *s)
 		else
 			scr &= ~SCSCR_RDRQE;
 	}
-	serial_port_out(port, SCSCR, scr | SCSCR_RIE);
+	sci_serial_out(port, SCSCR, scr | SCSCR_RIE);
 }
 
 static void sci_dma_rx_complete(void *arg)
@@ -1714,8 +1713,8 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
 	if (s->chan_rx) {
-		u16 scr = serial_port_in(port, SCSCR);
-		u16 ssr = serial_port_in(port, SCxSR);
+		u16 scr = sci_serial_in(port, SCSCR);
+		u16 ssr = sci_serial_in(port, SCxSR);
 
 		/* Disable future Rx interrupts */
 		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
@@ -1733,10 +1732,10 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 
 			scr &= ~SCSCR_RIE;
 		}
-		serial_port_out(port, SCSCR, scr);
+		sci_serial_out(port, SCSCR, scr);
 		/* Clear current interrupt */
-		serial_port_out(port, SCxSR,
-				ssr & ~(SCIF_DR | SCxSR_RDxF(port)));
+		sci_serial_out(port, SCxSR,
+			       ssr & ~(SCIF_DR | SCxSR_RDxF(port)));
 		dev_dbg(port->dev, "Rx IRQ %lu: setup t-out in %u us\n",
 			jiffies, s->rx_timeout);
 		start_hrtimer_us(&s->rx_timer, s->rx_timeout);
@@ -1786,9 +1785,9 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 		return sci_tx_interrupt(irq, ptr);
 
 	uart_port_lock_irqsave(port, &flags);
-	ctrl = serial_port_in(port, SCSCR);
+	ctrl = sci_serial_in(port, SCSCR);
 	ctrl &= ~(SCSCR_TE | SCSCR_TEIE);
-	serial_port_out(port, SCSCR, ctrl);
+	sci_serial_out(port, SCSCR, ctrl);
 	uart_port_unlock_irqrestore(port, flags);
 
 	return IRQ_HANDLED;
@@ -1802,7 +1801,7 @@ static irqreturn_t sci_br_interrupt(int irq, void *ptr)
 	sci_handle_breaks(port);
 
 	/* drop invalid character received before break was detected */
-	serial_port_in(port, SCxRDR);
+	sci_serial_in(port, SCxRDR);
 
 	sci_clear_SCxSR(port, SCxSR_BREAK_CLEAR(port));
 
@@ -1816,7 +1815,7 @@ static irqreturn_t sci_er_interrupt(int irq, void *ptr)
 
 	if (s->irqs[SCIx_ERI_IRQ] == s->irqs[SCIx_BRI_IRQ]) {
 		/* Break and Error interrupts are muxed */
-		unsigned short ssr_status = serial_port_in(port, SCxSR);
+		unsigned short ssr_status = sci_serial_in(port, SCxSR);
 
 		/* Break Interrupt */
 		if (ssr_status & SCxSR_BRK(port))
@@ -1831,7 +1830,7 @@ static irqreturn_t sci_er_interrupt(int irq, void *ptr)
 	if (port->type == PORT_SCI) {
 		if (sci_handle_errors(port)) {
 			/* discard character in rx buffer */
-			serial_port_in(port, SCxSR);
+			sci_serial_in(port, SCxSR);
 			sci_clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
 		}
 	} else {
@@ -1856,12 +1855,12 @@ static irqreturn_t sci_mpxed_interrupt(int irq, void *ptr)
 	struct sci_port *s = to_sci_port(port);
 	irqreturn_t ret = IRQ_NONE;
 
-	ssr_status = serial_port_in(port, SCxSR);
-	scr_status = serial_port_in(port, SCSCR);
+	ssr_status = sci_serial_in(port, SCxSR);
+	scr_status = sci_serial_in(port, SCSCR);
 	if (s->params->overrun_reg == SCxSR)
 		orer_status = ssr_status;
 	else if (sci_getreg(port, s->params->overrun_reg)->size)
-		orer_status = serial_port_in(port, s->params->overrun_reg);
+		orer_status = sci_serial_in(port, s->params->overrun_reg);
 
 	err_enabled = scr_status & port_rx_irq_mask(port);
 
@@ -2038,7 +2037,7 @@ static void sci_free_irq(struct sci_port *port)
 
 static unsigned int sci_tx_empty(struct uart_port *port)
 {
-	unsigned short status = serial_port_in(port, SCxSR);
+	unsigned short status = sci_serial_in(port, SCxSR);
 	unsigned short in_tx_fifo = sci_txfill(port);
 
 	return (status & SCxSR_TEND(port)) && !in_tx_fifo ? TIOCSER_TEMT : 0;
@@ -2047,27 +2046,27 @@ static unsigned int sci_tx_empty(struct uart_port *port)
 static void sci_set_rts(struct uart_port *port, bool state)
 {
 	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
-		u16 data = serial_port_in(port, SCPDR);
+		u16 data = sci_serial_in(port, SCPDR);
 
 		/* Active low */
 		if (state)
 			data &= ~SCPDR_RTSD;
 		else
 			data |= SCPDR_RTSD;
-		serial_port_out(port, SCPDR, data);
+		sci_serial_out(port, SCPDR, data);
 
 		/* RTS# is output */
-		serial_port_out(port, SCPCR,
-				serial_port_in(port, SCPCR) | SCPCR_RTSC);
+		sci_serial_out(port, SCPCR,
+			       sci_serial_in(port, SCPCR) | SCPCR_RTSC);
 	} else if (sci_getreg(port, SCSPTR)->size) {
-		u16 ctrl = serial_port_in(port, SCSPTR);
+		u16 ctrl = sci_serial_in(port, SCSPTR);
 
 		/* Active low */
 		if (state)
 			ctrl &= ~SCSPTR_RTSDT;
 		else
 			ctrl |= SCSPTR_RTSDT;
-		serial_port_out(port, SCSPTR, ctrl);
+		sci_serial_out(port, SCSPTR, ctrl);
 	}
 }
 
@@ -2075,10 +2074,10 @@ static bool sci_get_cts(struct uart_port *port)
 {
 	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
 		/* Active low */
-		return !(serial_port_in(port, SCPDR) & SCPDR_CTSD);
+		return !(sci_serial_in(port, SCPDR) & SCPDR_CTSD);
 	} else if (sci_getreg(port, SCSPTR)->size) {
 		/* Active low */
-		return !(serial_port_in(port, SCSPTR) & SCSPTR_CTSDT);
+		return !(sci_serial_in(port, SCSPTR) & SCSPTR_CTSDT);
 	}
 
 	return true;
@@ -2108,9 +2107,8 @@ static void sci_set_mctrl(struct uart_port *port, unsigned int mctrl)
 		 */
 		reg = sci_getreg(port, SCFCR);
 		if (reg->size)
-			serial_port_out(port, SCFCR,
-					serial_port_in(port, SCFCR) |
-					SCFCR_LOOP);
+			sci_serial_out(port, SCFCR,
+				       sci_serial_in(port, SCFCR) | SCFCR_LOOP);
 	}
 
 	mctrl_gpio_set(s->gpios, mctrl);
@@ -2120,21 +2118,21 @@ static void sci_set_mctrl(struct uart_port *port, unsigned int mctrl)
 
 	if (!(mctrl & TIOCM_RTS)) {
 		/* Disable Auto RTS */
-		serial_port_out(port, SCFCR,
-				serial_port_in(port, SCFCR) & ~SCFCR_MCE);
+		sci_serial_out(port, SCFCR,
+			       sci_serial_in(port, SCFCR) & ~SCFCR_MCE);
 
 		/* Clear RTS */
 		sci_set_rts(port, 0);
 	} else if (s->autorts) {
 		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
 			/* Enable RTS# pin function */
-			serial_port_out(port, SCPCR,
-				serial_port_in(port, SCPCR) & ~SCPCR_RTSC);
+			sci_serial_out(port, SCPCR,
+				sci_serial_in(port, SCPCR) & ~SCPCR_RTSC);
 		}
 
 		/* Enable Auto RTS */
-		serial_port_out(port, SCFCR,
-				serial_port_in(port, SCFCR) | SCFCR_MCE);
+		sci_serial_out(port, SCFCR,
+			       sci_serial_in(port, SCFCR) | SCFCR_MCE);
 	} else {
 		/* Set RTS */
 		sci_set_rts(port, 1);
@@ -2187,8 +2185,8 @@ static void sci_break_ctl(struct uart_port *port, int break_state)
 	}
 
 	uart_port_lock_irqsave(port, &flags);
-	scsptr = serial_port_in(port, SCSPTR);
-	scscr = serial_port_in(port, SCSCR);
+	scsptr = sci_serial_in(port, SCSPTR);
+	scscr = sci_serial_in(port, SCSCR);
 
 	if (break_state == -1) {
 		scsptr = (scsptr | SCSPTR_SPB2IO) & ~SCSPTR_SPB2DT;
@@ -2198,8 +2196,8 @@ static void sci_break_ctl(struct uart_port *port, int break_state)
 		scscr |= SCSCR_TE;
 	}
 
-	serial_port_out(port, SCSPTR, scsptr);
-	serial_port_out(port, SCSCR, scscr);
+	sci_serial_out(port, SCSPTR, scsptr);
+	sci_serial_out(port, SCSCR, scscr);
 	uart_port_unlock_irqrestore(port, flags);
 }
 
@@ -2239,9 +2237,9 @@ static void sci_shutdown(struct uart_port *port)
 	 * Stop RX and TX, disable related interrupts, keep clock source
 	 * and HSCIF TOT bits
 	 */
-	scr = serial_port_in(port, SCSCR);
-	serial_port_out(port, SCSCR, scr &
-			(SCSCR_CKE1 | SCSCR_CKE0 | s->hscif_tot));
+	scr = sci_serial_in(port, SCSCR);
+	sci_serial_out(port, SCSCR,
+		       scr & (SCSCR_CKE1 | SCSCR_CKE0 | s->hscif_tot));
 	uart_port_unlock_irqrestore(port, flags);
 
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
@@ -2390,19 +2388,19 @@ static void sci_reset(struct uart_port *port)
 	unsigned int status;
 	struct sci_port *s = to_sci_port(port);
 
-	serial_port_out(port, SCSCR, s->hscif_tot);	/* TE=0, RE=0, CKE1=0 */
+	sci_serial_out(port, SCSCR, s->hscif_tot);	/* TE=0, RE=0, CKE1=0 */
 
 	reg = sci_getreg(port, SCFCR);
 	if (reg->size)
-		serial_port_out(port, SCFCR, SCFCR_RFRST | SCFCR_TFRST);
+		sci_serial_out(port, SCFCR, SCFCR_RFRST | SCFCR_TFRST);
 
 	sci_clear_SCxSR(port,
 			SCxSR_RDxF_CLEAR(port) & SCxSR_ERROR_CLEAR(port) &
 			SCxSR_BREAK_CLEAR(port));
 	if (sci_getreg(port, SCLSR)->size) {
-		status = serial_port_in(port, SCLSR);
+		status = sci_serial_in(port, SCLSR);
 		status &= ~(SCLSR_TO | SCLSR_ORER);
-		serial_port_out(port, SCLSR, status);
+		sci_serial_out(port, SCLSR, status);
 	}
 
 	if (s->rx_trigger > 1) {
@@ -2540,8 +2538,8 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	 * It controls the mux to select (H)SCK or frequency divided clock.
 	 */
 	if (best_clk >= 0 && sci_getreg(port, SCCKS)->size) {
-		serial_port_out(port, SCDL, dl);
-		serial_port_out(port, SCCKS, sccks);
+		sci_serial_out(port, SCDL, dl);
+		sci_serial_out(port, SCCKS, sccks);
 	}
 
 	uart_port_lock_irqsave(port, &flags);
@@ -2554,7 +2552,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	bits = tty_get_frame_size(termios->c_cflag);
 
 	if (sci_getreg(port, SEMR)->size)
-		serial_port_out(port, SEMR, 0);
+		sci_serial_out(port, SEMR, 0);
 
 	if (best_clk >= 0) {
 		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
@@ -2569,9 +2567,9 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 			case 27: smr_val |= SCSMR_SRC_27; break;
 			}
 		smr_val |= cks;
-		serial_port_out(port, SCSCR, scr_val | s->hscif_tot);
-		serial_port_out(port, SCSMR, smr_val);
-		serial_port_out(port, SCBRR, brr);
+		sci_serial_out(port, SCSCR, scr_val | s->hscif_tot);
+		sci_serial_out(port, SCSMR, smr_val);
+		sci_serial_out(port, SCBRR, brr);
 		if (sci_getreg(port, HSSRR)->size) {
 			unsigned int hssrr = srr | HSCIF_SRE;
 			/* Calculate deviation from intended rate at the
@@ -2593,7 +2591,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 					 HSCIF_SRHP_MASK;
 				hssrr |= HSCIF_SRDE;
 			}
-			serial_port_out(port, HSSRR, hssrr);
+			sci_serial_out(port, HSSRR, hssrr);
 		}
 
 		/* Wait one bit interval */
@@ -2601,10 +2599,10 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	} else {
 		/* Don't touch the bit rate configuration */
 		scr_val = s->cfg->scscr & (SCSCR_CKE1 | SCSCR_CKE0);
-		smr_val |= serial_port_in(port, SCSMR) &
+		smr_val |= sci_serial_in(port, SCSMR) &
 			   (SCSMR_CKEDG | SCSMR_SRC_MASK | SCSMR_CKS);
-		serial_port_out(port, SCSCR, scr_val | s->hscif_tot);
-		serial_port_out(port, SCSMR, smr_val);
+		sci_serial_out(port, SCSCR, scr_val | s->hscif_tot);
+		sci_serial_out(port, SCSMR, smr_val);
 	}
 
 	sci_init_pins(port, termios->c_cflag);
@@ -2613,7 +2611,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	s->autorts = false;
 	reg = sci_getreg(port, SCFCR);
 	if (reg->size) {
-		unsigned short ctrl = serial_port_in(port, SCFCR);
+		unsigned short ctrl = sci_serial_in(port, SCFCR);
 
 		if ((port->flags & UPF_HARD_FLOW) &&
 		    (termios->c_cflag & CRTSCTS)) {
@@ -2630,7 +2628,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 		 */
 		ctrl &= ~(SCFCR_RFRST | SCFCR_TFRST);
 
-		serial_port_out(port, SCFCR, ctrl);
+		sci_serial_out(port, SCFCR, ctrl);
 	}
 	if (port->flags & UPF_HARD_FLOW) {
 		/* Refresh (Auto) RTS */
@@ -2645,7 +2643,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	if (port->type != PORT_SCI)
 		scr_val |= SCSCR_TE;
 	scr_val |= SCSCR_RE | (s->cfg->scscr & ~(SCSCR_CKE1 | SCSCR_CKE0));
-	serial_port_out(port, SCSCR, scr_val | s->hscif_tot);
+	sci_serial_out(port, SCSCR, scr_val | s->hscif_tot);
 	if ((srr + 1 == 5) &&
 	    (port->type == PORT_SCIFA || port->type == PORT_SCIFB)) {
 		/*
@@ -3017,9 +3015,6 @@ static int sci_init_single(struct platform_device *dev,
 	port->irq		= sci_port->irqs[SCIx_RXI_IRQ];
 	port->irqflags		= 0;
 
-	port->serial_in		= sci_serial_in;
-	port->serial_out	= sci_serial_out;
-
 	return 0;
 }
 
@@ -3056,21 +3051,21 @@ static void serial_console_write(struct console *co, const char *s,
 		uart_port_lock_irqsave(port, &flags);
 
 	/* first save SCSCR then disable interrupts, keep clock source */
-	ctrl = serial_port_in(port, SCSCR);
+	ctrl = sci_serial_in(port, SCSCR);
 	ctrl_temp = SCSCR_RE | SCSCR_TE |
 		    (sci_port->cfg->scscr & ~(SCSCR_CKE1 | SCSCR_CKE0)) |
 		    (ctrl & (SCSCR_CKE1 | SCSCR_CKE0));
-	serial_port_out(port, SCSCR, ctrl_temp | sci_port->hscif_tot);
+	sci_serial_out(port, SCSCR, ctrl_temp | sci_port->hscif_tot);
 
 	uart_console_write(port, s, count, serial_console_putchar);
 
 	/* wait until fifo is empty and last bit has been transmitted */
 	bits = SCxSR_TDxE(port) | SCxSR_TEND(port);
-	while ((serial_port_in(port, SCxSR) & bits) != bits)
+	while ((sci_serial_in(port, SCxSR) & bits) != bits)
 		cpu_relax();
 
 	/* restore the SCSCR */
-	serial_port_out(port, SCSCR, ctrl);
+	sci_serial_out(port, SCSCR, ctrl);
 
 	if (locked)
 		uart_port_unlock_irqrestore(port, flags);
@@ -3503,8 +3498,6 @@ static int __init early_console_setup(struct earlycon_device *device,
 	if (!device->port.membase)
 		return -ENODEV;
 
-	device->port.serial_in = sci_serial_in;
-	device->port.serial_out	= sci_serial_out;
 	device->port.type = type;
 	memcpy(&sci_ports[0].port, &device->port, sizeof(struct uart_port));
 	port_cfg.type = type;
-- 
2.34.1


