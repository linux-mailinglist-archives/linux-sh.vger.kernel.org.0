Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD1416E3F
	for <lists+linux-sh@lfdr.de>; Wed,  8 May 2019 02:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfEHAa1 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 7 May 2019 20:30:27 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39842 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbfEHAa1 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 7 May 2019 20:30:27 -0400
Received: by mail-ot1-f68.google.com with SMTP id o39so16750016ota.6
        for <linux-sh@vger.kernel.org>; Tue, 07 May 2019 17:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aNugRNfI1NASCVQQotBkfUx3cjwsiA1TzUpe8ibe7ac=;
        b=gRIeqvWjXvHVuVEemJNJK8AS0nBpMXjQNbmZV9qOtFksOrHCfrqeuX/vrn0nS6wwxy
         kLfpormJ8YBe4ZEF9hNxd/IFXkViwzDXyjJ7SWlHab5fqkWfEG9z/QESkM0GYa14N37c
         lpNEiivZk/k4qPe6YXKCt/Usic/XxFC7BwQxcRPqPZt9yKca0JFbo8LULWWrbneDHmq+
         K8a2yddzszAkKsKQ3kY36HSo7YkWplePB3l48/W53IN9tPwuJM2Yv7wbC95njLsaoego
         6jh4lLkkJ43Um5WDoj3cd+7cCVtFpC4h2yUMlngnDEfXLG3iM/uPEArsgoY53kR9Wc3H
         DUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aNugRNfI1NASCVQQotBkfUx3cjwsiA1TzUpe8ibe7ac=;
        b=TuKlIiZ8+bLH5YLDMTORfWXNoMy31GVCfise7KH3T5Zyk+AjRxRGgaVEJpdYpUd2R0
         IWbwFAOyCKimbv9Xoncx7AFvXIHQ7IwioAA4VE8+PUELcHyEDHzkwZJL3+2Xl6zjukpR
         ZT9QTg+yV8JtKrNv7miB+zwnGgEA+qZeVncLC0RNyDdLjM7KXt0LNyzqBq5eavVl8IH7
         V/Ud51xT8iLG0PK5D3Xnm8IyXuP81Hxc/YVa5Q9zi3G2kgW9gRSGfensa9QK3mxSyXOf
         PIUC/Z1qvHjsAJFyacLucKLZG7IjUulayxaM5klmEPKH3hbgd5YhQ6GthsmSDKtHYDcs
         D/AQ==
X-Gm-Message-State: APjAAAUUH1zQ8qiwvAhqaQrXLGDoWbVTF1nZLXxmdYAz+ze/vvPjBCsj
        pO8WupUU4QVV4yGJDigOIvQKHArx6sASS6AtMDUXXw==
X-Google-Smtp-Source: APXvYqwnFUcfnqP6BFgjGKomJPr5yaMMCBD85pEk3++fjkl68hk/raq4PqQ7V3ysBstXCoK7LDo9wO4kaWYzTHhnX6M=
X-Received: by 2002:a9d:5cc1:: with SMTP id r1mr22059155oti.229.1557275426847;
 Tue, 07 May 2019 17:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com> <20190507183804.5512-9-david@redhat.com>
In-Reply-To: <20190507183804.5512-9-david@redhat.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 7 May 2019 17:30:15 -0700
Message-ID: <CAPcyv4hzpuApmKHhC6mHnE-RmiZ8Aspiv5wfd+Fs4QmaDsCJVw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] mm/memory_hotplug: Remove "zone" parameter from sparse_remove_one_section
To:     David Hildenbrand <david@redhat.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh <linux-sh@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Tue, May 7, 2019 at 11:39 AM David Hildenbrand <david@redhat.com> wrote:
>
> Unused, and memory unplug path should never care about zones. This is
> the job of memory offlining. ZONE_DEVICE might require special care -
> the caller of arch_remove_memory() should handle this.

The ZONE_DEVICE usage does not require special care so you can drop
that comment. The only place it's used in the subsection patches is to
lookup the node-id, but it turns out that the resulting node-id is
then never used.

With the ZONE_DEVICE mention dropped out of changelog you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
