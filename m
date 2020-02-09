Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAEE156875
	for <lists+linux-sh@lfdr.de>; Sun,  9 Feb 2020 04:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbgBIDFD (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 8 Feb 2020 22:05:03 -0500
Received: from mail01.vodafone.es ([217.130.24.71]:51088 "EHLO
        mail01.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727532AbgBIDFD (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 8 Feb 2020 22:05:03 -0500
IronPort-SDR: pInukXd3zgim/vH0QWX94QqBCRWqZzVOW0XYhXQSeBJms8yQXJ9kTR4rdE0TGr9CjVCkwE6X2a
 fP/TiaB6ZgJw==
IronPort-PHdr: =?us-ascii?q?9a23=3Ag1e6NxyffxYfICjXCy+O+j09IxM/srCxBDY+r6?=
 =?us-ascii?q?Qd2+gWIJqq85mqBkHD//Il1AaPAdyHra8UwLaH++C4ACpcuM3H6ChDOLV3FD?=
 =?us-ascii?q?Y9wf0MmAIhBMPXQWbaF9XNKxIAIcJZSVV+9Gu6O0UGUOz3ZlnVv2HgpWVKQk?=
 =?us-ascii?q?a3OgV6PPn6FZDPhMqrye+y54fTYwJVjzahfL9+Nhq7oRjeu8UMgYZvKak9xx?=
 =?us-ascii?q?TNr3BVf+ha2X5kKUickhrh6Mq85oJv/zhVt/k868NOTKL2crgiQ7dFFjomKW?=
 =?us-ascii?q?c15MPqtRnHUwSC42YXX3sVnBRVHQXL9Qn2UZjtvCT0sOp9wzSaMtbtTb8oQz?=
 =?us-ascii?q?Si7rxkRwHuhSwaKjM26mDXish3jKJGvBKsogF0zoDIbI2JMvd1Y6XQds4YS2?=
 =?us-ascii?q?VcRMZcTyJPDIOmb4URDOQPIOlXoJXyqVYVsRuzBxWjCP/zxjNUmHP727Ax3e?=
 =?us-ascii?q?Q7EQHB2QwtB8gAv2rIrNrrLqcZTOC6zK7OzTXMcvhb3i/955bUch8/u/GNU7?=
 =?us-ascii?q?VwcczeyUQ0DAzFiUifppbkPjOS0OQCrXKX4PZnVeKqkmMqrRx6rDu3xso0lI?=
 =?us-ascii?q?XFm4AYxkrZ+Sh33Io5P8O0RUFhbdOqEJZdsTyROZFsTcM4WW5ovT43yrgBuZ?=
 =?us-ascii?q?GmYicH0I8nxxvDa/yfdIiI/w7jWP6RIThmgHJlf6qyhxOo/kihzu38TNe70F?=
 =?us-ascii?q?JWoidKiNXMqHcN2AHJ5ciJTft9+Fmu1SyR2ADI8u1EIEY0mrTHK5M53LI8i5?=
 =?us-ascii?q?gevV7eEiL4hEn6lrGae0o+9uWm6+nrerDmqYWdN49whAH+KKMumsmnDOQgLA?=
 =?us-ascii?q?cOQ3aU+f6y1b3k+035T65HgeYxkqbEqp/bJMMbpqinDANPzokj7BO/Ay+80N?=
 =?us-ascii?q?sEhXkHME5FeBWfgojtOlHOJu34DPimj1S3kDdm3O7GPrL/DZXXNHTDk6nufa?=
 =?us-ascii?q?x760FCzAo/19df54hbCuJJHPWmXk73qcydFR8RLQO52aDkBc9724dYXniAUZ?=
 =?us-ascii?q?WUKKfDjVjd3u8zLvPEW4gTt36pM/U56uTxink2mUQXdqmq9ZQSYXG8WP9hJh?=
 =?us-ascii?q?PKT2Drh4I5HHsHpEIBS+rlwAmaXCJefWm1Wa0U7DY3AZChC4qFTYeo1u/SlB?=
 =?us-ascii?q?ynF4FbMzgVQmuHFm3lIt2J?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FJbQBVdj9eeiMYgtlmHQEBAQkBEQU?=
 =?us-ascii?q?FAYF7AgGBPQKBVlINExKMZIZwgU0fg0OLaIEAgzOGCBOBZw0BAQEBARsaAgE?=
 =?us-ascii?q?BhECCRiQ8Ag0CAw0BAQUBAQEBAQUEAQECEAEBCwsLBCuFSkIBDAGBayKDcCA?=
 =?us-ascii?q?POUpMAQ4BhiIBATOlU4kBDQ0ChR6CWAQKgQiBGyOBNgIBAYwhGoFBP4EjIYI?=
 =?us-ascii?q?rCAGCAYJ/ARIBboJIglkEjVASIYk/mDCCRAR4lWuCOAEPiBGENQOCWA+BC4M?=
 =?us-ascii?q?dgwiBZ4RSgX6fWIQSV4Egc3EzGiOCHYEgTxgNnGICQIEXEAJPhDuGNoIyAQE?=
X-IPAS-Result: =?us-ascii?q?A2FJbQBVdj9eeiMYgtlmHQEBAQkBEQUFAYF7AgGBPQKBV?=
 =?us-ascii?q?lINExKMZIZwgU0fg0OLaIEAgzOGCBOBZw0BAQEBARsaAgEBhECCRiQ8Ag0CA?=
 =?us-ascii?q?w0BAQUBAQEBAQUEAQECEAEBCwsLBCuFSkIBDAGBayKDcCAPOUpMAQ4BhiIBA?=
 =?us-ascii?q?TOlU4kBDQ0ChR6CWAQKgQiBGyOBNgIBAYwhGoFBP4EjIYIrCAGCAYJ/ARIBb?=
 =?us-ascii?q?oJIglkEjVASIYk/mDCCRAR4lWuCOAEPiBGENQOCWA+BC4MdgwiBZ4RSgX6fW?=
 =?us-ascii?q?IQSV4Egc3EzGiOCHYEgTxgNnGICQIEXEAJPhDuGNoIyAQE?=
X-IronPort-AV: E=Sophos;i="5.70,419,1574118000"; 
   d="scan'208";a="315685828"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail01.vodafone.es with ESMTP; 09 Feb 2020 04:05:00 +0100
Received: (qmail 9295 invoked from network); 9 Feb 2020 00:49:17 -0000
Received: from unknown (HELO 192.168.1.163) (apamar@[217.217.179.17])
          (envelope-sender <peterwong@bodazone.com>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-sh@vger.kernel.org>; 9 Feb 2020 00:49:17 -0000
Date:   Sun, 9 Feb 2020 01:49:07 +0100 (CET)
From:   Peter Wong <peterwong@bodazone.com>
Reply-To: Peter Wong <peterwonghsbchk@gmail.com>
To:     linux-sh@vger.kernel.org
Message-ID: <16312820.233973.1581209357396.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Greetings,
Please check the attached email for a buisness proposal to explore.
Looking forward to hearing from you for more details.
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

