Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 277AA5305E5
	for <lists+linux-sh@lfdr.de>; Sun, 22 May 2022 22:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350869AbiEVUnz (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 22 May 2022 16:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235481AbiEVUny (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 22 May 2022 16:43:54 -0400
X-Greylist: delayed 3289 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 22 May 2022 13:43:53 PDT
Received: from out8.nocdirect.com (out8.nocdirect.com [69.73.171.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801691403A
        for <linux-sh@vger.kernel.org>; Sun, 22 May 2022 13:43:53 -0700 (PDT)
Received: from binky.nswebhost.com ([69.73.168.248])
        by spamexperts03.nocdirect.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <support@iesottawa.ca>)
        id 1nsrZU-0000RP-8A
        for linux-sh@vger.kernel.org; Sun, 22 May 2022 15:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=iesottawa.ca; s=default; h=Sender:Content-Type:MIME-Version:Message-ID:
        Reply-To:From:Date:Subject:To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tsytaq9P6jbx84sZaeZ2ujyYY054YqWU2QI73VCcE8s=; b=Uhj/HxFZt/b24CyB56s2yfPfoa
        Y58FUfHOzBnkxpSsclIqaFeRZ1yEHBQmjQ6ft69XDvSS1lSUUBsHWQw+nnGib83cx606QaG7ur8Z5
        ulqLA924OPWVf+tydHMQ744TF/sgGvh5boRLjSWnaejNtemyrN2tEyA+ltX4WfpABRSQOsRXNI43o
        s4sNFuUOMweduLBjQ0vu0EZqlA4aHtfZboLwSfVMWWcJRTsx33ZspSsCrWEQMnJqthmlDMndwwlJ4
        nSN03FS0n2t+v0jDyv/AweqTWhh8LtH5K6CFmLJkibgxpEEsWi96Ap+BXo366Zbv3xOl8IXaWpxSg
        N/fMPt7Q==;
Received: from ottawa by binky.nswebhost.com with local (Exim 4.93)
        (envelope-from <support@iesottawa.ca>)
        id 1nsrYU-0007BS-0V
        for linux-sh@vger.kernel.org; Sun, 22 May 2022 15:47:58 -0400
To:     linux-sh@vger.kernel.org
Subject: Re: Looking forward to hearing from you
X-PHP-Script: iesottawa.ca/modules/mod_simplefileuploadv1.3/elements/bcqkhulk.php for 36.37.185.70
Date:   Sun, 22 May 2022 19:47:58 +0000
From:   "Mrs. Mamand Mashamsul" <support@iesottawa.ca>
Reply-To: mrsmamands@gmail.com
Message-ID: <ceee1e1dc947bf4f2369a17b0cb905d2@iesottawa.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender:  <ottawa@binky.nswebhost.com>
X-Originating-IP: 69.73.168.248
X-SpamExperts-Domain: nocdirect.com
X-SpamExperts-Username: binky
Authentication-Results: nocdirect.com; auth=pass (login) smtp.auth=binky@nocdirect.com
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.83)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9NxnHXhFI9aLFhf4G9YVDvPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xvR28ya2chVISbdgCQ5rzzW4h0KqOTIGbSh7sPxo0b07gN
 zB/4Jkrw1eDLcif59fsIsT83vl+1bmtnUwX2zThxgYVALhXkueKT79r7FRLqfcoJDehyBsdBu50D
 mtW4oaJLav+rNhkBvA/yx3UOkyxilU4PumfG+1zay7DesNa5m5kncdbkChqOd1xRCjRXrOUo6w9/
 xJPGBYLRFSVc+fdHZK0EMmf3P50Ajf/tIX00Fi2UzZMb4kuX6D5eETmGUuUcqbdy+7WYS7ujrPXH
 qhox0HpT3S2SFmqVvJUoDpLg17fDQD9rTYKpWUjzugBu3bR7NBygveb6c8kYDlcMKNLdfoLeZ09b
 xZt+2giPJq6hQNKJ9zpkh4CBVZNevlN99LDk6xV06FcgZkQoEFV+s1chVLvKs3jED+rkxy9HfVI3
 2AJ/g31PqNR+MEBwOQya+LjmlTqiXb5DktChYWJ+7Vxty4Cn30yIJe57hjvyCVNd+NjlDHh8k6TT
 dHl8m1/8O/+GvmcnNbFGJXJDA267gIcXe8nVzIfQ9pH2EV9pPX+JYOKK2nN+Ec8agd1+3wZtTuaw
 Q9SKTje6CpR9gNDhPcPWfj39Hngyb8Y2hAlYFgIDPxi6R+2ZJAIWHs0KPnepAlMlC1QqG5wZG0oX
 2QUKBbmIiwQzKw+6v3CaIMG6s7LqJIQj1LuoK31lBRJSSr7O4nJm4eDGPWQjiHziZaTK5a5hOaER
 09pylr3JOzG82NgSsIRua2uI8+dem7Ll9P8oM7dDPDo3pDJlUlQ25PasjIMI/mKKM1+EgghWm5D0
 3bCLK+uO5TcDeKjrEmYPn2IVWRvTk6nHRRspqNsaP48+Pyzv2RAMUzcxPFk6QeElJUkx8BJ8JwTn
 a1RcqY1+KjpDJopf41QeuQVkfXoTGRWEU/OLQ+Z6IxeQ3uxPHIN2qm5xKroy2+XMVhIoa/OtSSGm
 Yp9mtlRTKBfv33uOwsmJdRic
X-Report-Abuse-To: spam@spamexperts01.nocdirect.com
X-Spam-Status: Yes, score=6.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        HK_NAME_MR_MRS,PHP_SCRIPT,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [69.73.171.7 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.7 SPF_SOFTFAIL SPF: sender does not match SPF record (softfail)
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.5 PHP_SCRIPT Sent by PHP script
        *  1.0 HK_NAME_MR_MRS No description available.
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Greatings Dear

I am Mrs. Mamand Mashamsul, from Kabul, Capital of Afghanistan. With due respect, I want to know if foreigners can buy and own properties in your beautiful country, I desire to relocate my investment capital abroad where it will generate more returns. 
 
I will appreciate your response. Please let me know your ideas and knowledge regarding my research. In Any viable investment idea you suggest to me will be also be considered. 
 
Looking forward to hearing from you.

Best regards,
Mrs. Mamand Mashamsul

