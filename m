Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9304AAC886
	for <lists+linux-sh@lfdr.de>; Sat,  7 Sep 2019 19:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbfIGRxc (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 7 Sep 2019 13:53:32 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39004 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfIGRxc (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 7 Sep 2019 13:53:32 -0400
Received: by mail-lj1-f196.google.com with SMTP id j16so8923759ljg.6
        for <linux-sh@vger.kernel.org>; Sat, 07 Sep 2019 10:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JJRFoANDdA7LVjR/dXOt13NCYJCwAkkvMBjFRYL2CJk=;
        b=O0k0d7lqzfAmPEYFzDlOGgQsR12LVtrvxo5oTKj/qTWwdx05EQgXW+UipRXAFcHY7l
         NJSN5sB8Bd0GzZnsutsLrlnHa03N+sVzppgC400AeuuF3leAik8ua94YYTL1N/jeDSEY
         p0NLqzIjW/MddvLJPDdxPws4zfzc5nCUgJ+sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JJRFoANDdA7LVjR/dXOt13NCYJCwAkkvMBjFRYL2CJk=;
        b=BkSDfbeWLOmy8TaVymK0oqqbe6Xcp/YseZr/Jh8Cmu0ecNgzLkfqGTURZY+AIkiVyY
         aIpG+pud7NcveRI1Zx03qUjZFeYmdeclYTxOVNRS7Qw9DRXa+cikVz7DUdGDBFQQxqXE
         yaO9cvcTSZYCZpYrqKqYfn8BMhJ3qwitIxlGpi1TTq5QUPQH8NQuPwguf1HXOqNMl3cW
         ibGF41/PQfPBS4YPPwAeztB7hnH5/SYn4NL6H7Jg4LsCo8+/y3eQekK3o2u7r5OlmGQh
         IDPuDPn3TqhyWc8RJAcm3IBhNShvRQA4iij4puCTVC6mYmOcCewHMMZZLvk4ZkFph9m7
         oYew==
X-Gm-Message-State: APjAAAV9M4GzBWsb8KIzSmZ96tbTOpwWKiECUXqMq7DFqFF7WSN+k3ET
        1TetBJnFAm6tDALqyuGUJFjA5Vj6K80=
X-Google-Smtp-Source: APXvYqzd2ACq1ucjY4CQRUCiqXQCH03bXcHtAVZKUiuvGcb9j83J5ASrrnUkLJelQiUd+Kwfkt1UTg==
X-Received: by 2002:a2e:99c1:: with SMTP id l1mr3958486ljj.8.1567878810000;
        Sat, 07 Sep 2019 10:53:30 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id j5sm1808398lfm.29.2019.09.07.10.53.29
        for <linux-sh@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Sep 2019 10:53:29 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id l20so8927449ljj.3
        for <linux-sh@vger.kernel.org>; Sat, 07 Sep 2019 10:53:29 -0700 (PDT)
X-Received: by 2002:a2e:8645:: with SMTP id i5mr9691835ljj.165.1567878349245;
 Sat, 07 Sep 2019 10:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190904201933.10736-1-cyphar@cyphar.com> <20190904201933.10736-12-cyphar@cyphar.com>
 <7236f382d72130f2afbbe8940e72cc67e5c6dce0.camel@kernel.org>
 <CAHk-=whZx97Nm-gUK0ppofj2RA2LLz2vmaDUTKSSV-+yYB9q_Q@mail.gmail.com> <C81D6D29-F6BF-48E6-A15E-3ABCB2C992E5@amacapital.net>
In-Reply-To: <C81D6D29-F6BF-48E6-A15E-3ABCB2C992E5@amacapital.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 7 Sep 2019 10:45:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=whe90Ec_RRrMRLE0=bJOHNS9YmVwcytVxmrfK3oCuZF6A@mail.gmail.com>
Message-ID: <CAHk-=whe90Ec_RRrMRLE0=bJOHNS9YmVwcytVxmrfK3oCuZF6A@mail.gmail.com>
Subject: Re: [PATCH v12 11/12] open: openat2(2) syscall
To:     Andy Lutomirski <luto@amacapital.net>
Cc:     Jeff Layton <jlayton@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian@brauner.io>,
        Eric Biederman <ebiederm@xmission.com>,
        Andy Lutomirski <luto@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>, Tycho Andersen <tycho@tycho.ws>,
        David Drysdale <drysdale@google.com>,
        Chanho Min <chanho.min@lge.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Aleksa Sarai <asarai@suse.de>,
        Linux Containers <containers@lists.linux-foundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On Sat, Sep 7, 2019 at 10:42 AM Andy Lutomirski <luto@amacapital.net> wrote:
>
> Linus, you rejected resolveat() because you wanted a *nice* API

No. I rejected resoveat() because it was a completely broken garbage
API that couldn't do even basic stuff right (like O_CREAT).

We have a ton of flag space in the new openat2() model, we might as
well leave the old flags alone that people are (a) used to and (b) we
have code to support _anyway_.

Making up a new flag namespace is only going to cause us - and users -
more work, and more confusion. For no actual advantage. It's not going
to be "cleaner". It's just going to be worse.

                 Linus
