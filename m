Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED7B1F7C8
	for <lists+linux-sh@lfdr.de>; Wed, 15 May 2019 17:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728420AbfEOPkV (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 15 May 2019 11:40:21 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41080 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728326AbfEOPkU (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 15 May 2019 11:40:20 -0400
Received: by mail-ed1-f67.google.com with SMTP id m4so428226edd.8
        for <linux-sh@vger.kernel.org>; Wed, 15 May 2019 08:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xdgkq7E7+92ZW8x2Wkn7bfn+NRy1PNeG8DcUh6bxPio=;
        b=bfuTPZdAtZJEgr+LRkX72jzoj84BPgpwvQPX7TINdboNhdzKNjJGvDzVvqvaaAh8Km
         iqTakFfgT4CJH4/cI6DSpX88s8Sfap4XoOKg2RDeLLxirLNHPqbOEbbj/6aCt06XF/9P
         X/us6CYYROr8DPKhgLY3SLh3ZeL1/eih/MR9PMbtrWfnl7CFIcBUAogBL0DY90Buod6x
         uECgJQv/SirIkuk/ECloyg95oA5R0oldoWVKg0CvJmRDjoeJEJ6edtPOwuBN6C4fcGnO
         BW2YYNw0hfraOKLIXAT/1qzfZOA/kv0yJLeVZCoYp69fdwL2bHQEsKScA+TLGS8z8aPr
         de9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xdgkq7E7+92ZW8x2Wkn7bfn+NRy1PNeG8DcUh6bxPio=;
        b=Tc4Ej4tHXaoN4x8Lnfz9WW4I2pRA7lNrm5+DCGL6V/61x1J/HEijiMu0oC7MQvrHgR
         GMYqhm+wzhdkLXXWdSjcqP7dhJH95AUrq5HSLgcABN01G/N7Gud1pFUzVxFU1YE1iX3V
         m/JcXGZKY1nIo1Wev6cyBgU5mGD8zcqhR1q3IdsGAPpcoR2keGzuYEOvTQVt9KJK0iCD
         njSSByegJAkmeBuo8eJltUmEjxGcVIhhNnPAKpHiHnvUHFX5+BqvUIb46elsKFpYKAU6
         BYXPVQ2QBO8dI+T5IaBE1h03WmtCJpnpc9Ppw1vMUT9nmpYoSnzS6wBIFO9MCA2WCI9c
         Elzg==
X-Gm-Message-State: APjAAAX7byNAIVZq7BU0joOQgg5mdbtoJkVhuJBeguqNdCz9+Hjd66aH
        Bmf+VovrC2n1myXP1lg1WEGJtQ==
X-Google-Smtp-Source: APXvYqwxmqRE9VJlOAD22A4kr7WHnyESSHU1d/yh8q05kzTP6OSdD5czfo3EsMWHZUHFy4XAQOiyOg==
X-Received: by 2002:a50:87b5:: with SMTP id a50mr42379905eda.118.1557934819122;
        Wed, 15 May 2019 08:40:19 -0700 (PDT)
Received: from brauner.io ([193.96.224.243])
        by smtp.gmail.com with ESMTPSA id p52sm887134eda.79.2019.05.15.08.40.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 15 May 2019 08:40:18 -0700 (PDT)
Date:   Wed, 15 May 2019 17:40:15 +0200
From:   Christian Brauner <christian@brauner.io>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     jannh@google.com, viro@zeniv.linux.org.uk,
        torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de, dhowells@redhat.com, akpm@linux-foundation.org,
        cyphar@cyphar.com, ebiederm@xmission.com,
        elena.reshetova@intel.com, keescook@chromium.org,
        luto@amacapital.net, luto@kernel.org, tglx@linutronix.de,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-api@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] pid: add pidfd_open()
Message-ID: <20190515154014.4jaxuw4fcgbusnbt@brauner.io>
References: <20190515100400.3450-1-christian@brauner.io>
 <20190515143857.GB18892@redhat.com>
 <20190515153515.GA20783@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190515153515.GA20783@redhat.com>
User-Agent: NeoMutt/20180716
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Wed, May 15, 2019 at 05:35:15PM +0200, Oleg Nesterov wrote:
> On 05/15, Oleg Nesterov wrote:
> >
> > On 05/15, Christian Brauner wrote:
> > >
> > > +SYSCALL_DEFINE2(pidfd_open, pid_t, pid, unsigned int, flags)
> > > +{
> > > +	int fd, ret;
> > > +	struct pid *p;
> > > +	struct task_struct *tsk;
> > > +
> > > +	if (flags)
> > > +		return -EINVAL;
> > > +
> > > +	if (pid <= 0)
> > > +		return -EINVAL;
> > > +
> > > +	p = find_get_pid(pid);
> > > +	if (!p)
> > > +		return -ESRCH;
> > > +
> > > +	rcu_read_lock();
> > > +	tsk = pid_task(p, PIDTYPE_PID);
> >
> > You do not need find_get_pid() before rcu_lock and put_pid() at the end.
> > You can just do find_vpid() under rcu_read_lock().
> 
> Ah, sorry. Somehow I forgot you need to call pidfd_create(pid), you can't
> do this under rcu_read_lock().
> 
> So I was wrong, you can't avoid get/put_pid.

Yeah, I haven't made any changes yet.

Christian
