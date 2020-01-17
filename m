Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFC61405DC
	for <lists+linux-sh@lfdr.de>; Fri, 17 Jan 2020 10:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgAQJL3 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 17 Jan 2020 04:11:29 -0500
Received: from sonic304-56.consmr.mail.bf2.yahoo.com ([74.6.128.31]:43504 "EHLO
        sonic304-56.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726596AbgAQJL3 (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 17 Jan 2020 04:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1579252286; bh=owsUWMRaK8VDZFph0644yfuDush4SZnXA+CB/p+W8OY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=Y+9DiBsFIS5avbZ79u/CEwIalP4Fj7zwjDZWh8OMh7Md0pRN2e08EThsY3scxEklygFINvQ2UbN2hZc8HKnQb3DqrJ76fQD7Vnfg+endBS8ZiffYwqxxzMiRCS8gpKPdo8UwT4TiuusvPy2aTlPz0YyOpyGMf2Eamu1QiJLwxz5C3KNbOmVQ6CNQtjTiep7V60MhCnnUkEN71cFWIezoVObbnLwMqVgOcSTer9vUNS99PmWRY1KAbpFbx1aJzjHPmmyVG7mkW4zCffjbI9K6BJBCQPuhCjvkJoW0fK+E1d1+VOWAlw+sRwGRCgAbNtWyHO0RJsOG+xtjs08Y5+x0sA==
X-YMail-OSG: XZBuMPoVM1mX.388_ggbcvJ0JaCFZ3cx4Zsif_H9HGvAHB4y6XgNNBkhAW4L30c
 MYR4qlcOICEvAvpsjWSpFKkyZiRA2R_b.heIBO3jK6yVJGVit7nmFiRpETA96E2JAEWieCSXxAYc
 wcqqg2kf96vwP.B7ZqvXtpeDY2zCuP36NDcudtiGl9jB_62bZMszA6vaKXAKsDCfDm6VGt2NpOPj
 A6UPCSX.MsI9fkZkpBg7WO8JnuaRLs8T6yRcnrL2RvjfkUtFg6L17IMjkM9uyxFuph6kiIlcwEFE
 VOSMz7XTPNDSYbKbenySACPUoKoLP4Ocs.5tCOxkKAaJH8RZIYGMDB9Z9GTNoXRwFiHKsTkJASWi
 Wfqu4atfOC1k.5ZdEoujMBdnZO7ItZmG5ckk6_bMP0DoVu.LED5SfUxXO3GyHu1OqG3RLCg1cCdB
 SBqc8Eo.Y2qwejdDE7kYz8yov6EThtCmdybwA52scJAJCTWeeQNFAGiU9pYRNOXNjwZ1JY.glHzD
 2MkrA4hYrpEy38aLncAKncMeAHwHv.A772x781YoxDp1X8lkdMC9lqhBw22KALEfkEc8jypcylx7
 IGaoWsbaHPtf7svKflvT4py8gyEAlf3zLyi6sumlSNwqBiLhkU2.5n6txsbO2BbBqB2v3hqfEDzT
 9bSnhimpGCsOafrD8q0X2sdmHCk5GA2AvuSBnZQwIDw2G6ygnXgoGf6.qF4bwS2_tg8iD5_psC_q
 s5LjvHF6WtXDwYiFG_u5l.yIP6pM8LSIK1FoAOPeQhgOrO1PxArFTNcP0dzbH3zGP9IYAd_0Xup3
 gyTsxll0ppYKGb01rNU5iF0HSAQZi4APAU5nn2RaTIwVvC58hOTEp7W_V4JCHMiaol66..Aq4FoE
 jhXFdnpCgSBBXvugslSmdH3LDdn94zb3naThrLboFkfleeDVIcDleIktK3eo6w4pUKImuSCjpos5
 o8P.M2s7RMcOsR19g6jIQ2qixs6w8wImB8baOqlU2TWXGg8eeQN8FRA07SxOERKo4sERWlnOX0Qg
 1eHlFUo2NrV0OpMJHt7UBdVb46Vlaq1Dsx5Rf.EJZZK.tGumV1ZRgiSSFwoCuNbMCQQE30yxd5FR
 zYrEyzmE06DkDY6lEXU65g3zgL_zAG9katB9hoYPKJhTLWxHsff2FeuaCmSemKOIH75SrSSEUHiJ
 Of92wuX4znHBnSLSldzg8hngzd3SIdy1U38ebTP45BF.Gt9KikdyvkCz1AoWxBQ34dhtdzsrxbDJ
 4rA6DjDMk6iNfp8g9c1_VZDDsNu8ZaoC3Z50vFp9.uI.4iQtITBN9.cnlaLm1eTJ_xinWBeZLi6a
 9
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.bf2.yahoo.com with HTTP; Fri, 17 Jan 2020 09:11:26 +0000
Date:   Fri, 17 Jan 2020 09:11:25 +0000 (UTC)
From:   Sophia Lucas <sophialucas052@gmail.com>
Reply-To: sophialucas052@gmail.com
Message-ID: <662625513.8619116.1579252285733@mail.yahoo.com>
Subject: Very Urgent,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <662625513.8619116.1579252285733.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.14873 YMailNodin Mozilla/5.0 (Windows NT 6.3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org





May=C2=A0the=C2=A0peace=C2=A0of=C2=A0God=C2=A0be=C2=A0with=C2=A0you,

My=C2=A0dear,=C2=A0I=C2=A0am=C2=A0writing=C2=A0this=C2=A0mail=C2=A0to=C2=A0=
you=C2=A0with=C2=A0heavy=C2=A0sorrow=C2=A0in=C2=A0my=C2=A0heart,=C2=A0this=
=C2=A0massage=C2=A0mighty=C2=A0comes=C2=A0to=C2=A0you=C2=A0as=C2=A0a=C2=A0s=
urprise=C2=A0but=C2=A0I=C2=A0chose=C2=A0to=C2=A0reach=C2=A0you=C2=A0through=
=C2=A0this=C2=A0email=C2=A0because=C2=A0it=C2=A0still=C2=A0remains=C2=A0the=
=C2=A0fastest=C2=A0medium=C2=A0of=C2=A0communicating=C2=A0with=C2=A0you.=C2=
=A0Please=C2=A0give=C2=A0me=C2=A0this=C2=A0little=C2=A0chance=C2=A0to=C2=A0=
explain=C2=A0myself=C2=A0to=C2=A0you,=C2=A0I=C2=A0would=C2=A0have=C2=A0like=
=C2=A0to=C2=A0meet=C2=A0you=C2=A0in=C2=A0person=C2=A0before=C2=A0departing=
=C2=A0from=C2=A0this=C2=A0mother=C2=A0earth=C2=A0but=C2=A0due=C2=A0to=C2=A0=
the=C2=A0illness=C2=A0continue=C2=A0to=C2=A0deprive=C2=A0me=C2=A0the=C2=A0c=
hance=C2=A0but=C2=A0even=C2=A0if=C2=A0I=C2=A0die=C2=A0on=C2=A0the=C2=A0proc=
ess=C2=A0of=C2=A0this=C2=A0illness=C2=A0I=C2=A0will=C2=A0still=C2=A0praise=
=C2=A0ALMIGHTY=C2=A0God.

First=C2=A0let=C2=A0me=C2=A0kindly=C2=A0introduce=C2=A0myself=C2=A0to=C2=A0=
you=C2=A0my=C2=A0names=C2=A0are=C2=A0Mrs.=C2=A0Sophia=C2=A0Lucas,=C2=A0I=C2=
=A0am=C2=A0a=C2=A0dying=C2=A0woman=C2=A0diagnosed=C2=A0of=C2=A0cancer=C2=A0=
for=C2=A0about=C2=A01=C2=A0year=C2=A0ago,=C2=A0immediately=C2=A0after=C2=A0=
the=C2=A0death=C2=A0of=C2=A0my=C2=A0beloved=C2=A0husband,=C2=A0who=C2=A0has=
=C2=A0left=C2=A0me=C2=A0everything=C2=A0he=C2=A0worked=C2=A0with=C2=A0and=
=C2=A0an=C2=A0bank=C2=A0deposit=C2=A0of=C2=A0the=C2=A0sum=C2=A0of=C2=A0(Ele=
ven=C2=A0Million=C2=A0Dollars)=C2=A0with=C2=A0my=C2=A0name=C2=A0as=C2=A0the=
=C2=A0legal=C2=A0rightful=C2=A0appointed=C2=A0beneficiary=C2=A0to=C2=A0the=
=C2=A0fund.=C2=A0But=C2=A0/next=C2=A0of=C2=A0kin=E2=80=99s=C2=A0according=
=C2=A0to=C2=A0my=C2=A0doctor=C2=A0he=C2=A0told=C2=A0me=C2=A0that=C2=A0I=C2=
=A0would=C2=A0not=C2=A0last=C2=A0for=C2=A0a=C2=A0long=C2=A0period=C2=A0of=
=C2=A0time=C2=A0because=C2=A0this=C2=A0illness=C2=A0has=C2=A0gotten=C2=A0to=
=C2=A0a=C2=A0very=C2=A0bad=C2=A0stage.=C2=A0That=C2=A0is=C2=A0the=C2=A0reas=
on=C2=A0why=C2=A0i=C2=A0decided=C2=A0to=C2=A0entrust=C2=A0my=C2=A0inheritan=
ce=C2=A0money=C2=A0to=C2=A0you,=C2=A0I=C2=A0hoped=C2=A0that=C2=A0you=C2=A0w=
ill=C2=A0not=C2=A0expose=C2=A0or=C2=A0betray=C2=A0this=C2=A0trust=C2=A0and=
=C2=A0confident=C2=A0that=C2=A0I=C2=A0am=C2=A0about=C2=A0to=C2=A0repose=C2=
=A0on=C2=A0you=C2=A0for=C2=A0the=C2=A0mutual=C2=A0benefit=C2=A0of=C2=A0the=
=C2=A0orphans=C2=A0and=C2=A0the=C2=A0less=C2=A0privileges=C2=A0ones,=C2=A0b=
elieving=C2=A0that=C2=A0you=C2=A0will=C2=A0utilize=C2=A0the=C2=A0money=C2=
=A0the=C2=A0way=C2=A0i=C2=A0am=C2=A0going=C2=A0to=C2=A0instruct=C2=A0herein=
=C2=A0as=C2=A0i=C2=A0mentioned=C2=A0above.=C2=A0I=C2=A0need=C2=A0you=C2=A0t=
o=C2=A0assist=C2=A0me=C2=A0to=C2=A0reclaim=C2=A0this=C2=A0money=C2=A0from=
=C2=A0the=C2=A0bank=C2=A0where=C2=A0it's=C2=A0been=C2=A0deposited=C2=A0by=
=C2=A0my=C2=A0late=C2=A0husband=C2=A0and=C2=A0use=C2=A0the=C2=A0fund=C2=A0f=
or=C2=A0Charity=C2=A0works=C2=A0in=C2=A0your=C2=A0position=C2=A0before=C2=
=A0I=C2=A0die,=C2=A0such=C2=A0as=C2=A0orphanages=C2=A0and=C2=A0gives=C2=A0j=
ustice=C2=A0and=C2=A0help=C2=A0to=C2=A0the=C2=A0poor,=C2=A0needy,=C2=A0elde=
rly=C2=A0ones=C2=A0and=C2=A0the=C2=A0widow=C2=A0says=C2=A0The=C2=A0Lord."=
=C2=A0Jeremiah=C2=A022:15-16.=E2=80=9C=C2=A0to=C2=A0promote=C2=A0the=C2=A0w=
ord=C2=A0of=C2=A0god=C2=A0and=C2=A0the=C2=A0effort=C2=A0that=C2=A0the=C2=A0=
house=C2=A0of=C2=A0god=C2=A0is=C2=A0maintained.

I=C2=A0do=C2=A0not=C2=A0want=C2=A0a=C2=A0situation=C2=A0where=C2=A0this=C2=
=A0money=C2=A0will=C2=A0be=C2=A0used=C2=A0in=C2=A0an=C2=A0ungodly=C2=A0mann=
er.=C2=A0That's=C2=A0why=C2=A0I'm=C2=A0taking=C2=A0this=C2=A0decision.=C2=
=A0I'm=C2=A0not=C2=A0afraid=C2=A0of=C2=A0death,=C2=A0so=C2=A0I=C2=A0know=C2=
=A0where=C2=A0I'm=C2=A0going.=C2=A0I=C2=A0accept=C2=A0this=C2=A0decision=C2=
=A0because=C2=A0I=C2=A0do=C2=A0not=C2=A0have=C2=A0any=C2=A0child=C2=A0who=
=C2=A0will=C2=A0inherit=C2=A0this=C2=A0money=C2=A0after=C2=A0I=C2=A0die.=C2=
=A0To=C2=A0be=C2=A0very=C2=A0honest=C2=A0with=C2=A0you,=C2=A0this=C2=A0mone=
y=C2=A0I=C2=A0have=C2=A0opened-up=C2=A0to=C2=A0you=C2=A0is=C2=A0totally=C2=
=A0genuine=C2=A0no=C2=A0complications=C2=A0and=C2=A0is=C2=A0100%=C2=A0risk-=
free.=C2=A0I=C2=A0am=C2=A0absolutely=C2=A0assuring=C2=A0you=C2=A0that=C2=A0=
no=C2=A0problem=C2=A0involved=C2=A0in=C2=A0this=C2=A0fund=C2=A0either=C2=A0=
in=C2=A0the=C2=A0short-run=C2=A0or=C2=A0in=C2=A0the=C2=A0long-run=C2=A0beca=
use=C2=A0i=C2=A0am=C2=A0the=C2=A0legal=C2=A0rightful=C2=A0appointed=C2=A0ne=
xt=C2=A0of=C2=A0kin's=C2=A0to=C2=A0the=C2=A0fund=C2=A0everything=C2=A0is=C2=
=A0legitimate.

And=C2=A0it=C2=A0will=C2=A0be=C2=A0my=C2=A0great=C2=A0pleasure=C2=A0to=C2=
=A0compensate=C2=A0you=C2=A0with=C2=A035=C2=A0%=C2=A0percent=C2=A0of=C2=A0t=
he=C2=A0total=C2=A0money=C2=A0for=C2=A0your=C2=A0personal=C2=A0use,=C2=A05=
=C2=A0%=C2=A0percent=C2=A0for=C2=A0any=C2=A0expenses=C2=A0that=C2=A0may=C2=
=A0occur=C2=A0during=C2=A0the=C2=A0transaction=C2=A0and=C2=A0while=C2=A060%=
=C2=A0of=C2=A0the=C2=A0money=C2=A0will=C2=A0go=C2=A0to=C2=A0the=C2=A0charit=
y=C2=A0project=C2=A0OR=C2=A0better=C2=A0still=C2=A0you=C2=A0can=C2=A0invest=
=C2=A0the=C2=A0total=C2=A0fund=C2=A0into=C2=A0your=C2=A0personal=C2=A0busin=
ess=C2=A0ventures=C2=A0and=C2=A0make=C2=A0sure=C2=A0you=C2=A0assist=C2=A0th=
e=C2=A0orphanages=C2=A0and=C2=A0the=C2=A0less=C2=A0privileged=C2=A0and=C2=
=A0do=C2=A0other=C2=A0Charitable=C2=A0works=C2=A0with=C2=A0the=C2=A0profit=
=C2=A0you=C2=A0will=C2=A0make=C2=A0from=C2=A0the=C2=A0business.=C2=A0I=C2=
=A0will=C2=A0appreciate=C2=A0your=C2=A0utmost=C2=A0confidentiality=C2=A0and=
=C2=A0trust=C2=A0in=C2=A0this=C2=A0matter=C2=A0to=C2=A0accomplish=C2=A0my=
=C2=A0heart=C2=A0desire,=C2=A0as=C2=A0I=C2=A0don't=C2=A0want=C2=A0anything=
=C2=A0that=C2=A0will=C2=A0jeopardize=C2=A0the=C2=A0fund=C2=A0my=C2=A0late=
=C2=A0husband=C2=A0has=C2=A0worked=C2=A0for=C2=A0and=C2=A0my=C2=A0last=C2=
=A0wish.=C2=A0Upon=C2=A0your=C2=A0reply,=C2=A0I=C2=A0will=C2=A0give=C2=A0yo=
u=C2=A0more=C2=A0details=C2=A0and=C2=A0the=C2=A0bank=C2=A0contact=C2=A0info=
rmation=C2=A0including=C2=A0my=C2=A0late=C2=A0husband=C2=A0account=C2=A0det=
ails=C2=A0also=C2=A0a=C2=A0letter=C2=A0of=C2=A0authorization=C2=A0which=C2=
=A0will=C2=A0enable=C2=A0you=C2=A0proceed=C2=A0communication=C2=A0with=C2=
=A0the=C2=A0bank=C2=A0for=C2=A0the=C2=A0claim=C2=A0of=C2=A0the=C2=A0fund=C2=
=A0as=C2=A0the=C2=A0rightful=C2=A0legal=C2=A0present=C2=A0beneficiary=C2=A0=
of=C2=A0the=C2=A0fund.=C2=A0All=C2=A0I=C2=A0need=C2=A0from=C2=A0you=C2=A0is=
=C2=A0sincerity=C2=A0and=C2=A0ability=C2=A0to=C2=A0complete=C2=A0God=C2=A0t=
ask=C2=A0without=C2=A0any=C2=A0failure.

It=C2=A0will=C2=A0be=C2=A0my=C2=A0pleasure=C2=A0to=C2=A0see=C2=A0that=C2=A0=
the=C2=A0bank=C2=A0has=C2=A0release=C2=A0and=C2=A0transfer=C2=A0the=C2=A0fu=
nd=C2=A0into=C2=A0your=C2=A0bank=C2=A0account=C2=A0therein=C2=A0country=C2=
=A0even=C2=A0before=C2=A0I=C2=A0die=C2=A0here=C2=A0in=C2=A0the=C2=A0hospita=
l.=C2=A0Because=C2=A0of=C2=A0my=C2=A0present=C2=A0health=C2=A0status=C2=A0e=
verything=C2=A0need=C2=A0to=C2=A0be=C2=A0process=C2=A0rapidly=C2=A0as=C2=A0=
soon=C2=A0as=C2=A0possible.=C2=A0Please=C2=A0kindly=C2=A0respond=C2=A0quick=
ly.=C2=A0Thanks=C2=A0and=C2=A0God=C2=A0bless=C2=A0you,

May=C2=A0God=C2=A0Bless=C2=A0you=C2=A0for=C2=A0your=C2=A0kind=C2=A0help.
Yours=C2=A0sincerely=C2=A0sister=C2=A0Mrs.=C2=A0Sophia=C2=A0Lucas.
