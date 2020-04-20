Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8931F1B12B0
	for <lists+linux-sh@lfdr.de>; Mon, 20 Apr 2020 19:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbgDTRLu (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 20 Apr 2020 13:11:50 -0400
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:44430 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgDTRLu (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 20 Apr 2020 13:11:50 -0400
Date:   Mon, 20 Apr 2020 13:11:49 -0400
From:   Rich Felker <dalias@libc.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     linux-sh@vger.kernel.org, ysato@users.sourceforge.jp,
        linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: Re: [PATCH 1/2] sh: remove sh5 support
Message-ID: <20200420171149.GB11469@brightrain.aerifal.cx>
References: <20200420123844.3998746-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420123844.3998746-1-arnd@arndb.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Mon, Apr 20, 2020 at 02:38:43PM +0200, Arnd Bergmann wrote:
> sh5 never became a product and has probably never really worked.
> 
> Remove it by recursively deleting all associated Kconfig options
> and all corresponding files.
> 
> For review purposes, this leaves out the files that can now be
> removed, in particular

Thank you! I haven't reviewed this yet, but if others do before I get
to it I'm happy to go with their opinions. I've been wanting to get
this removed for a long time because cleaning out stuff that's not
used/useful makes it easier to see what needs to be done for sh2/3/4
(rest of DT conversion, mmu support for j-core).

Rich
