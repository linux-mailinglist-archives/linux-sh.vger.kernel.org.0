Return-Path: <linux-sh+bounces-3636-lists+linux-sh=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-sh@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ktZ3CmCE02nEigcAu9opvQ
	(envelope-from <linux-sh+bounces-3636-lists+linux-sh=lfdr.de@vger.kernel.org>)
	for <lists+linux-sh@lfdr.de>; Mon, 06 Apr 2026 12:01:04 +0200
X-Original-To: lists+linux-sh@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C048C3A2B8A
	for <lists+linux-sh@lfdr.de>; Mon, 06 Apr 2026 12:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFF043001473
	for <lists+linux-sh@lfdr.de>; Mon,  6 Apr 2026 10:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5674078F3A;
	Mon,  6 Apr 2026 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5R6Xe8T"
X-Original-To: linux-sh@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCC12744F
	for <linux-sh@vger.kernel.org>; Mon,  6 Apr 2026 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775469661; cv=pass; b=JNw6JJYW62OsGFrOaX3BuXNx6/rxGxveaBNsYkefaPHmAH2j83rrJ4XuPmRVssnodT8nhCc75t6oBuMqZRcE0CS9f8Z3hn9po5bW6GpKn4W4EyAqSSXDDBR9Muim1bcpiCEZ2FeEyFXrIzULWZn2oKhriaJnf0pzNBo58SA5kUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775469661; c=relaxed/simple;
	bh=8G1m2FSYsFkKXZglfXyEOi1IrEtO09ILVoN4mjM723Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWEPHJbqOjyGG4OrwxVrftGhoc5KQd8d+PX+n4qWQUkux+D/1bwsqntZvMXWbFYtRvQ1x9Q6We9IcLRtaNAEUX47aD/yom2NrLelvAD/jNAzbGyo1zVZkwPCnbGG2SRb3R2OnDXFBlfSeVdvcYRiAj1n7eA9yfqFC5DYgkvsbSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5R6Xe8T; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66bb7e098b1so3938216a12.3
        for <linux-sh@vger.kernel.org>; Mon, 06 Apr 2026 03:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775469658; cv=none;
        d=google.com; s=arc-20240605;
        b=khtOmNkFJSyNq8UATAeg0v3JLTUpr0q+pjS4IVhpIj2T9148QmVU4fh6bGpwY0qzTo
         FA91bZ5U147tEr2Hka4dVtjUVi2+kkpdw2Q4qpyIf+Mrh4AqCDlD0azdMYk5SExHcY9n
         CCU18W3cR90qg5udUePlYp/I0i4oQ4Fk3UTlbI/ozoSi8DPL4PswVkvhgsXpB5VaXlsy
         VgKh66vw5TrMMDkWwdJs6tdqf/fR0WgWegqV06EO6iPMv2moC/pCqTdzFGRFWSh5fkmI
         nM+mk5fsVclPsYydQ3VqbtObC2yWZ9ZBcF+/5YDT86scsHOViZr8wSiivpKbubzs6hVT
         wjeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8G1m2FSYsFkKXZglfXyEOi1IrEtO09ILVoN4mjM723Q=;
        fh=T7yRQISD0yERY0gXvmjYvSbtZGnWtgsippBK2HCeEXc=;
        b=G+6o77zld4h0qJ2ZaDgXnCNPKimVwqQ/T5kD4nbcRa+WUnhXy769K9s/4Imobouvaf
         2oDUxAQJmpGbJtgWN5GSlIiu1BT6ka1+6Ov3qXJK7KLGHDvuG/e4hQyYR6bnBjqJYPrP
         RG9IpjCvaXmAUPk8VI7tEQyRDqRicq1jI0ebYoy5UzHw3CXgi+k+89kCvbvQ4zgn/kQI
         L/59njxw95WZQ9xj1cVkcWO9qZOJ0qk/Rcgyg5K+Vd+Pk05e49fYdZ/ksSWqlkRESmir
         LGL++KPbqO2w7bxq/aP+AetXPvJfnH11wQlKr59yiMUJ1zjkfFCYyms0rKyzXja2UFet
         JCNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775469658; x=1776074458; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8G1m2FSYsFkKXZglfXyEOi1IrEtO09ILVoN4mjM723Q=;
        b=j5R6Xe8T+7KihlI8Wt1oKJSM3I4Bw75etsoq6XI6RRbTymkHPsi/HlRsN6nmr4IIo5
         0lBbcUHvYjlQRGQdNs/NJ16cbbVdCSViSeFCF6HRnKHw1UYY0Wuzu4kNc7wfI5NREOAH
         gBXOrTpcqFVjCqQN7V7/nH6AWNYW+1DuO+IDMn1E+GgH8+PiPzPXB8VLPiwuytd+/rPP
         1KWMyLZj9qQRUxxVqD6ZzDQaoi+6H7Og4ypkZa7IcDtP9uBDAuWn5i2gOAmzh8UMnBwO
         pfjnv5sopywQoplRT1pyLuejN7eyIf03w0EJVnBLSXaJH8LQ48uCSo4SmLGrvseRdPVA
         zWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775469658; x=1776074458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8G1m2FSYsFkKXZglfXyEOi1IrEtO09ILVoN4mjM723Q=;
        b=ZlLCdurS9R9hMzwQNMH6kRNPHzogfknWIvY3HxcmJZh46/13QeD7UV/XwHsHRRsICd
         oixEaE5+hNrPDeMcHC/qJoBK8HdZmC7o6As20ur2vM8SeEBZ4NbqbRyAnfYD//YnEaSP
         xyVDny1sZP6Xdm1/unPcgFT8+UFjj4O812wM4gvmbyKYuiGRat7ynJ91O2YypLBsKMT1
         0f3RYYASIoaZkkefqrz9fJrUOj4kBzLxrHUpjOpElUP+RRjnODYc1nbkTTu0iwiVDx7W
         uy5ukxAfljItqbOLwUaWSHnqywREnToJkR5KY6EbXBFJoYPjjg5Wm7UXfMUQjOYwpe7D
         9eXg==
X-Gm-Message-State: AOJu0YwDh3uninqh8/YU1j1jdvpfJ8FfMwy7ADvRhRxahhYkePE9Pmb+
	dz3Q3A3liOFrWhV9L+d4FvYcEqGhX4fU3uwSppHbXiYZzrB3EMWnL26lTT1Z72kmu3qfn40tbi/
	MNgg1v3pa1WjXl/zArkjV2jMkxv4FkrM=
X-Gm-Gg: AeBDievotZicyb1JEM/CAT5STOieuOU6pp00LEweenO42/bbne5JHrvmaEREe4QC97R
	k2pOSRyccfFAYm0b7JXqPo57N43LFOIp/GmUM6W9ijnRa0XnwdUiYIheT5IooKWx0Fa0H+zb/c+
	EmmV2sDkm+DagLYcB6mKKCclR8yVGM24BnGDmyvnbFaOCdlMTE/Sfs0XnZYzM+ITmTzLh0aOzRo
	Akdy8s+Jya80ek3UWYvF2tG0JzSd2OHVllD02zEE/T2H6+Bt5SZ2va2Mdbd4olQqSA5f+dd6DN6
	/danQNItJQVrze3Fnr+MJEFe5BFH2CcsHFCKLLLvsaVcvbnn2oDxSwUfdeB8BOF4sIXRFPbp2TK
	tvdLyU2PZzEU=
X-Received: by 2002:a05:6402:5243:b0:65b:93ec:597a with SMTP id
 4fb4d7f45d1cf-66e3f711f40mr5774671a12.19.1775469658088; Mon, 06 Apr 2026
 03:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405082330.4104672-1-fuchsfl@gmail.com> <20260405082330.4104672-3-fuchsfl@gmail.com>
 <CACwZE5Rmy3A0k3tvc32gv0V3T1LL2PaP_+S7N87mwNppLTh=PA@mail.gmail.com> <adN68wCJd6QEZyNW@lithos>
In-Reply-To: <adN68wCJd6QEZyNW@lithos>
From: Adrian McMenamin <adrianmcmenamin@gmail.com>
Date: Mon, 6 Apr 2026 11:00:44 +0100
X-Gm-Features: AQROBzCFC2whgyXLg6umvpZAwq9qO8027E8IBT_YajB5ZqkYTsFGzzd3NORhmeA
Message-ID: <CACwZE5RfGW24wnWnwmSR0xUm1EZCCAzuaqug1FbhqeXXqEDTQw@mail.gmail.com>
Subject: Re: [PATCH 2/2] cdrom: gdrom: update gendisk capacity on open
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: linux-sh@vger.kernel.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Artur Rojek <contact@artur-rojek.eu>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3636-lists,linux-sh=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adrianmcmenamin@gmail.com,linux-sh@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-sh];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C048C3A2B8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Florian,

On Mon, 6 Apr 2026 at 10:20, Florian Fuchs <fuchsfl@gmail.com> wrote:


>
> You mean, because one of the functions in the call tree of
> gdrom_update_capacity() wants to get the mutex gdrom_mutex or s_umount?
> I checked the locally called functions, but don't see that one tries to
> aquire a lock.
>
> I don't understand the exact potential of the race condition, maybe you
> can elaborate, where I should look.
>


Actually, having looked at the code path in detail too I agree that
this won't recreate the problem the earlier patch addressed, so this
looks good to me.

