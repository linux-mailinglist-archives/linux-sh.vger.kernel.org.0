Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E062864A8
	for <lists+linux-sh@lfdr.de>; Wed,  7 Oct 2020 18:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgJGQjU (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 7 Oct 2020 12:39:20 -0400
Received: from sonic312-21.consmr.mail.bf2.yahoo.com ([74.6.128.83]:45262 "EHLO
        sonic312-21.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726702AbgJGQjU (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 7 Oct 2020 12:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602088758; bh=PxMwWzXvs+dqOoH0/FHvFmQpYH2JguaCUHYAVLLmaiw=; h=Date:From:Reply-To:Subject:References:From:Subject; b=QL45aJpRH9cVRIHs76jUDF22e14ocB/sInrmrOl1Ypmk/2M265rhkEnbVyu1LlVdg/y5/3VIPeTbPi6ymfKmTduNtPWgeMObpc4np+t3fYBJjB/VLcx6+779V6RImOd2svZjNoTDV4an1z8Br2c91/sM7dR8f66k0LRuSF4ziGcraGDENZSoVFPvRpwIomBCqvij4g0IqxFWn1ZjtFdep4CkZurDJj9GvfUU22sUIPImqWJ6uBO3f6maioxX3mF+vY+2gf4d4sMDKTwSXLGrw8UdTJ7kZwXMiV5UhH3rr8StYxvxoSlr7d1mJuR04KAs5RiNHo3IySJZ1N3R2bY07A==
X-YMail-OSG: YQcutz0VM1k_L.UbJTGAVmwbshEYnfvaPg6oDk.xjLtq_.GHm0nkDNtX5Cp_vrp
 ofK79et3k0CubO7c_0YaEIJLtxF8UZSNxtbhsJsPr9Jl7xxAanvtPuvFeKo1vg7NVt2tpD4SmAnJ
 2FfcY.h3qeWIjUXKrPZ0AjpoF0ll9uuhPe0YU9saYvxkRYrQ3btsXdfEnreWA73BW1qQZaDjurBS
 sKgpX6UlZ6EUUcSZZJTgaTI2A_7wATenrUX44LQTD88QsUZOou3IoAoP_5dzGq2xZGdnLbL_soxg
 ntMj0LlppFOuwhrDjgnYN2Tdx.zn9PX7RvKCzCgBwMJVxj3F26mlwaWaIMrCXupSsSna5SrLz_Lj
 AtR8S_NyQUxvXEpsUbIOgDvJxwdi8cW8DdXeefpGBk30bCxCnxRmauHZOT.6vuRdcZRdL63iGWj.
 ZbQ43L6WHN2j9RAnEMYo12Rxae0_lNrKWanx2D8Y.j39brhQjmgVexaqAN4Y4F9aNla9bJ3IyVbx
 Zqda3vpHAvJ5RZPG1REHmbt3ZaEmERew0D9wsGRpwec0RZ5j9UjhNJRsL2k2fHBs1GCEYYMT9f7s
 SX7XIv8JoiRayT365XjZP2Ql9MLcHLM7cV6.Vejg0vk3BgBwupKOMRhLpIopTZOG0KpSWFeChBO1
 u0IXgyz.B5SYSl8o5hYlGVFiml4Tn14ivtKyvXneoXi8zn7WENG2cNasvcy5ikBeofvH2pX6qLa3
 lzSAmbhWtcIQIxhnsCSLBzO_fWsftPD0P26SEI1nKyziPE1YABcxx7YBBUUK7ykg0zWb1i3EVb3O
 XNxjV2vpqzMZE4i0_F7C6y2ccee61.OymMpvYNdOFS.XCPGV9B0bOZAqXkNYe3NpG2LjQW_LnRzI
 WCxaSpcfYKKHNl5jRFGK5AFU_2psaQrhoiN4qJDXTJQkkOQAedQ0W2lK3WFst1A..XDWcxip.czd
 0Hd1JTdRZAFpxmPuyZy9kazWqzOzwyvAPw6DK6whSUEatzMDrUAodG4QRUUD5HEqVwiEe12He6nQ
 vXfqj.1SCyUSUeE4N_JIf_MZcuxJzeWPWfpol7TZPR2RHq6bcFB1TnLlv4lx9XXHwZonBpCPgo4t
 BSyw4JQggXjfuY22rd2yeZUswM.l6ALhP5XkuyHhM0FYXSlPbv3W647tYWr46N2HLtmM37VgelnH
 dhCQ0d0EIAqmyqs0zt6lNO9aPSI8TRpipMztgw5tNy4FMk52cat1d8z59ceyiyx0rxZzuLvziwVW
 O79EdG0A.NqU2RuGitvvxvf5ggH_gYwnCikVqhDErVxHGzAJsbFspJyP65Ft.WjnIP10xVnZq4f6
 FTEDMZRNv3B8vIk2MM7LRNo.notdp0Uwin4KLFbTfsLLjtGmIc9svMYKHYaBthRvFESx6_E5R7.V
 fU91cAlPb.Fj9I1fzKBNvsmcoL0H87Rmu_QlD5w--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Wed, 7 Oct 2020 16:39:18 +0000
Date:   Wed, 7 Oct 2020 16:39:18 +0000 (UTC)
From:   Mrs Marilyn Robert <fredodinga22@gmail.com>
Reply-To: marilyobert@gmail.com
Message-ID: <1390812764.157767.1602088758609@mail.yahoo.com>
Subject: =?UTF-8?B?0J3QsNGY0LzQuNC70LAg0LrQsNGYINCz0L7RgdC/0L7QtNCw0YDQvtGC?=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
References: <1390812764.157767.1602088758609.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16795 YMailNodin Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

DQoNCtCd0LDRmNC80LjQu9CwINC60LDRmCDQs9C+0YHQv9C+0LTQsNGA0L7Rgg0KDQrQiNCw0YEg
0YHRg9C8IDY4LdCz0L7QtNC40YjQvdCwINC20LXQvdCwLCDQutC+0ZjQsCDRgdGC0YDQsNC00LAg
0L7QtCDQv9GA0L7QtNC+0LvQttC10L0g0LrQsNGA0YbQuNC90L7QvCDQvdCwINC00L7RmNC60LAs
INC+0LQg0YHQuNGC0LUg0LzQtdC00LjRhtC40L3RgdC60Lgg0LjQvdC00LjQutCw0YbQuNC4LCDQ
vNC+0ZjQsNGC0LAg0YHQvtGB0YLQvtGY0LHQsCDQvdCw0LLQuNGB0YLQuNC90LAg0YHQtSDQstC7
0L7RiNC4INC4INC+0YfQuNCz0LvQtdC00L3QviDQtSDQtNC10LrQsCDQvNC+0LbQtdCx0Lgg0L3Q
tdC80LAg0LTQsCDQttC40LLQtdCw0Lwg0L/QvtCy0LXRnNC1INC+0LQg0YjQtdGB0YIg0LzQtdGB
0LXRhtC4INC60LDQutC+INGA0LXQt9GD0LvRgtCw0YIg0L3QsCDQsdGA0LfQuNC+0YIg0YDQsNGB
0YIg0Lgg0LHQvtC70LrQsNGC0LAg0YjRgtC+INGB0LUg0ZjQsNCy0YPQstCwINC60LDRmCDQvdC1
0LAuINCc0L7RmNC+0YIg0YHQvtC/0YDRg9CzINC/0L7Rh9C40L3QsCDQvdC10LrQvtC70LrRgyDQ
s9C+0LTQuNC90Lgg0L3QsNC90LDQt9Cw0LQg0Lgg0L3QsNGI0LjRgtC1INC00L7Qu9Cz0Lgg0LPQ
vtC00LjQvdC4INCx0YDQsNC6INC90LUg0LHQtdCwINCx0LvQsNCz0L7RgdC70L7QstC10L3QuCDR
gdC+INC90LjRgtGDINC10LTQvdC+INC00LXRgtC1LCDQv9C+INC90LXQs9C+0LLQsNGC0LAg0YHQ
vNGA0YIg0LPQviDQvdCw0YHQu9C10LTQuNCyINGG0LXQu9C+0YLQviDQvdC10LPQvtCy0L4g0LHQ
vtCz0LDRgtGB0YLQstC+Lg0KDQrQlNC+0LDRk9Cw0Lwg0LrQsNGYINCy0LDRgSDQvtGC0LrQsNC6
0L4g0YHQtSDQv9C+0LzQvtC70LjQsiDQt9CwINGC0L7QsCwg0L/QvtC00LPQvtGC0LLQtdC9INGB
0YPQvCDQtNCwINC00L7QvdC40YDQsNC8INGB0YPQvNCwINC+0LQgMiwgMzAwLCAwMDAg0LXQstGA
0LAg0LfQsCDQv9C+0LzQvtGIINC90LAg0YHQuNGA0L7QvNCw0YjQvdC40YLQtSwg0YHQuNGA0L7Q
vNCw0YjQvdC40YLQtSDQuCDQv9C+0LzQsNC70LrRgyDQv9GA0LjQstC40LvQtdCz0LjRgNCw0L3Q
uNGC0LUg0LzQtdGT0YMg0LLQsNGI0LjRgtC1INGB0L7QsdGA0LDQvdC40ZjQsCAvINC+0L/RiNGC
0LXRgdGC0LLQvi4g0JfQsNCx0LXQu9C10LbQtdGC0LUg0LTQtdC60LAg0L7QstC+0Zgg0YTQvtC9
0LQg0LUg0LTQtdC/0L7QvdC40YDQsNC9INCy0L4g0LHQsNC90LrQsCDQutCw0LTQtSDRiNGC0L4g
0YDQsNCx0L7RgtC10YjQtSDQvNC+0ZjQvtGCINGB0L7Qv9GA0YPQsy4gQXBwcmVjaWF0ZdC1INGG
0LXQvdCw0Lwg0LDQutC+INC+0LHRgNC90LXRgtC1INCy0L3QuNC80LDQvdC40LUg0L3QsCDQvNC+
0LXRgtC+INCx0LDRgNCw0ZrQtSDQt9CwINC/0YDQvtC/0LDQs9C40YDQsNGa0LUg0L3QsCDQvNCw
0YHQsNC20LDRgtCwINC90LAg0LrRgNCw0LvRgdGC0LLQvtGC0L4sINGc0LUg0LLQuCDQtNCw0LTQ
sNC8INC/0L7QstC10ZzQtSDQtNC10YLQsNC70Lgg0LfQsCDRgtC+0LAg0LrQsNC60L4g0LTQsCDQ
v9C+0YHRgtCw0L/QuNGC0LUuDQoNCtCR0LvQsNCz0L7QtNCw0YDQsNC8DQrQky3Rk9CwINCc0LXR
gNC40LvQuNC9INCg0L7QsdC10YDRgg==
