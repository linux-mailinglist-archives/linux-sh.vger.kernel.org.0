Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD5EE56651
	for <lists+linux-sh@lfdr.de>; Wed, 26 Jun 2019 12:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbfFZKML (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 26 Jun 2019 06:12:11 -0400
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:50810 "EHLO
        mail03.asahi-net.or.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfFZKMK (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 26 Jun 2019 06:12:10 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp [61.195.96.97])
        (Authenticated sender: PQ4Y-STU)
        by mail03.asahi-net.or.jp (Postfix) with ESMTPA id 531044AFC3;
        Wed, 26 Jun 2019 19:12:09 +0900 (JST)
Received: from yo-satoh-debian.ysato.ml (p033253.dynamic.ppp.asahi-net.or.jp [221.113.33.253])
        by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 02BDC240085;
        Wed, 26 Jun 2019 19:12:07 +0900 (JST)
Date:   Wed, 26 Jun 2019 19:12:04 +0900
Message-ID: <87woh8r6yz.wl-ysato@users.sourceforge.jp>
From:   Yoshinori Sato <ysato@users.sourceforge.jp>
To:     "Michael Karcher" <michael.karcher@fu-berlin.de>
Cc:     linux-sh@vger.kernel.org
Subject: Re: arch/sh: Check for kprobe trap number before trying to handle a kprobe trap
In-Reply-To: <60770.31.17.137.29.1560346556.webmail@webmail.zedat.fu-berlin.de>
References: <60770.31.17.137.29.1560346556.webmail@webmail.zedat.fu-berlin.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL/10.8 EasyPG/1.0.0 Emacs/25.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, 12 Jun 2019 22:35:56 +0900,
Michael Karcher wrote:
> 
> [1  <text/plain; utf-8 (8bit)>]
> 
> [2 0001-arch-sh-Check-for-kprobe-trap-number-before-trying-t.patch <application/octet-stream (base64)>]

Applied sh-next.
Thanks.

-- 
Yosinori Sato
