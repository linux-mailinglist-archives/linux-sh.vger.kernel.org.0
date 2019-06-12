Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6540B427B7
	for <lists+linux-sh@lfdr.de>; Wed, 12 Jun 2019 15:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729529AbfFLNf7 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 12 Jun 2019 09:35:59 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:37925 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726747AbfFLNf7 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 12 Jun 2019 09:35:59 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.85)
          with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
          (envelope-from <mkarcher@zedat.fu-berlin.de>)
          id <1hb3Pw-001woK-SM>; Wed, 12 Jun 2019 15:35:56 +0200
Received: from webmail1.zedat.fu-berlin.de ([130.133.4.91] helo=webmail.zedat.fu-berlin.de)
          by inpost2.zedat.fu-berlin.de (Exim 4.85)
          with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
          (envelope-from <mkarcher@zedat.fu-berlin.de>)
          id <1hb3Pw-0008tE-N3>; Wed, 12 Jun 2019 15:35:56 +0200
Received: from 31.17.137.29
        (ZEDAT-Webmail authenticated user mkarcher)
        by webmail.zedat.fu-berlin.de with HTTP;
        Wed, 12 Jun 2019 15:35:56 +0200
Message-ID: <60770.31.17.137.29.1560346556.webmail@webmail.zedat.fu-berlin.de>
Date:   Wed, 12 Jun 2019 15:35:56 +0200
Subject: arch/sh: Check for kprobe trap number before trying to handle a
 kprobe trap
From:   "Michael Karcher" <michael.karcher@fu-berlin.de>
To:     linux-sh@vger.kernel.org
Cc:     "Yoshinori Sato" <ysato@users.sourceforge.jp>
User-Agent: ZEDAT-Webmail
MIME-Version: 1.0
Content-Type: multipart/mixed;boundary="----=_20190612153556_51986"
X-Originating-IP: 130.133.4.91
X-ZEDAT-Hint: A
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

------=_20190612153556_51986
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


------=_20190612153556_51986
Content-Type: application/octet-stream;
 name="0001-arch-sh-Check-for-kprobe-trap-number-before-trying-t.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-arch-sh-Check-for-kprobe-trap-number-before-trying-t.patch"

RnJvbSA2ZDdjYzc0ZDhhYWQzMzU4OWM2Y2M2ZjM4ZTMzYzQyODRhYmMwN2I4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNaWNoYWVsIEthcmNoZXIgPGtlcm5lbEBta2FyY2hlci5kaWFs
dXAuZnUtYmVybGluLmRlPgpEYXRlOiBXZWQsIDEyIEp1biAyMDE5IDE1OjA4OjM3ICswMjAwClN1
YmplY3Q6IFtQQVRDSCAxLzFdIGFyY2gvc2g6IENoZWNrIGZvciBrcHJvYmUgdHJhcCBudW1iZXIg
YmVmb3JlIHRyeWluZyB0bwogaGFuZGxlIGEga3Byb2JlIHRyYXAKClRoZSBESUVfVFJBUCBub3Rp
ZmllciBjaGFpbiBpcyBydW4gYm90aCBmb3Iga3Byb2JlIHRyYXBzIGFuZCBmb3IgQlVHL1dBUk4K
dHJhcHMuIFRoZSBrcHJvYmUgY29kZSBhc3N1bWVzIHRvIGJlIG9ubHkgY2FsbGVkIGZvcgpCUkVB
S1BPSU5UX0lOU1RSVUNUSU9OLCBhbmQgY29uY2x1ZGVzIHRvIGhhdmUgaGl0IGEgY29uY3VycmVu
dGx5IHJlbW92ZWQKa3Byb2JlIGlmIGl0IGZpbmRzIGFueXRoaW5nIGVsc2UgYXQgdGhlIGZhdWx0
aW5nIGxvY2F0aW9ucy4gVGhpcyBpbmNsdWRlcwpUUkFQQV9CVUdfT1BDT0RFIHVzZWQgZm9yIEJV
RyBhbmQgV0FSTi4KClRoZSBjb25zZXF1ZW5jZSBpcyB0aGF0IGtwcm9iZV9oYW5kbGVyIHJldHVy
bnMgMS4gVGhpcyBtYWtlcwprcHJvYmVfZXhjZXB0aW9uc19ub3RpZnkgcmV0dXJuIE5PVElGWV9T
VE9QLCBhbmQgcHJldmVudHMgaGFuZGxpbmcgdGhlIEJVRwpzdGF0ZW1lbnQuIFRoaXMgYWxzbyBw
cmV2ZW50cyBtb3ZpbmcgJHBjIGF3YXkgZnJvbSB0aGUgdHJhcCBpbnN0cnVjdGlvbiwKc28gdGhl
IHN5c3RlbSBsb2NrcyB1cCBpbiBhbiBlbmRsZXNzIGxvb3AKClNpZ25lZC1vZmYtYnk6IE1pY2hh
ZWwgS2FyY2hlciA8a2VybmVsQG1rYXJjaGVyLmRpYWx1cC5mdS1iZXJsaW4uZGU+Ci0tLQogYXJj
aC9zaC9rZXJuZWwva3Byb2Jlcy5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3NoL2tlcm5lbC9rcHJvYmVz
LmMgYi9hcmNoL3NoL2tlcm5lbC9rcHJvYmVzLmMKaW5kZXggMWY4YzBkMzA1NjdmLi4zMTgyOTZm
NDhmMWEgMTAwNjQ0Ci0tLSBhL2FyY2gvc2gva2VybmVsL2twcm9iZXMuYworKysgYi9hcmNoL3No
L2tlcm5lbC9rcHJvYmVzLmMKQEAgLTQ4NSw3ICs0ODUsOCBAQCBpbnQgX19rcHJvYmVzIGtwcm9i
ZV9leGNlcHRpb25zX25vdGlmeShzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKnNlbGYsCiAJc3RydWN0
IGtwcm9iZV9jdGxibGsgKmtjYiA9IGdldF9rcHJvYmVfY3RsYmxrKCk7CiAKIAlhZGRyID0gKGtw
cm9iZV9vcGNvZGVfdCAqKSAoYXJncy0+cmVncy0+cGMpOwotCWlmICh2YWwgPT0gRElFX1RSQVAp
IHsKKwlpZiAodmFsID09IERJRV9UUkFQICYmCisJICAgIGFyZ3MtPnRyYXBuciA9PSAoQlJFQUtQ
T0lOVF9JTlNUUlVDVElPTiAmIDB4ZmYpKSB7CiAJCWlmICgha3Byb2JlX3J1bm5pbmcoKSkgewog
CQkJaWYgKGtwcm9iZV9oYW5kbGVyKGFyZ3MtPnJlZ3MpKSB7CiAJCQkJcmV0ID0gTk9USUZZX1NU
T1A7Ci0tIAoyLjExLjAKCg==
------=_20190612153556_51986--


