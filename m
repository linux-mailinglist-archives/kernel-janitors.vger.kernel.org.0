Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4BFB5B71
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Sep 2019 07:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfIRF5f (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 18 Sep 2019 01:57:35 -0400
Received: from mout.web.de ([212.227.15.14]:40727 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbfIRF5f (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Sep 2019 01:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1568786234;
        bh=Y31/2jTwqUjZ0NL2AeDbmonMiVQ3DJI61BWgvIIZ3bA=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=nYQQ8aQMA2FoF/khDuXi2xlN5pxe7fS+thWx171cTDxGuA2XtfbEdYTO4pLef44yt
         A7lyNuwVAqFXn/MBf/Nrov8EneGqEmbZkRfi4tZ2yBVaY23blqSGGaBD0a9mOclPgS
         iySMDwsdfO5Tmk3OiKHZ5CvRDMzgXuLF+HFlYZ3g=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.2.101]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M9XP5-1iMsLt1w1H-00D056; Wed, 18
 Sep 2019 07:57:14 +0200
To:     linux-arm-kernel@lists.infradead.org, Jun Nie <jun.nie@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Russell King <linux@armlinux.org.uk>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] ARM: zx: Use devm_platform_ioremap_resource() in
 zx296702_pd_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Himanshu Jha <himanshujha199640@gmail.com>
Message-ID: <30b6c588-6c4b-c8ff-6414-a3fc53867bfe@web.de>
Date:   Wed, 18 Sep 2019 07:57:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ABlpQxnXl+sRFgrhF2Ps9SUkBzUTwIpOLxc+5dv3VxYsm8Cjm12
 Pc4zG+DeqHaaX69urPW1Xyx6Ef+rn48odz6iyGs0biNUvYi62dqSt3vPuoDhvOsfnA0wvE1
 nyv3xpqUAFrNayfCCvma48N2KXOgp1GSDvP39vI8vzu15BnRJP8Hld+Ya7hzRMBXpaxadIe
 jt09f0fIf6IBjnwwwtusg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q+frnxjj08U=:vCHme45Iqx61x/+nW6Kot/
 TGNyfsj7Lqw886b0zoZeVue0bIs5bQXCFTsDtbVB3VMFcyx4pqjw61PJKbQbcdO6WaIH6gTRw
 DxCHZ9pXGtMszghjBRx+ZoJ/vMg4tpP91xMKVRDEGFHOgCp4rMabIOxSjItGR3BA8nKFuHLhy
 IOgGGe+jsyfBtXYxOJbJLVFStOwXrk0nPlm6r9XixlRMhfcmldZTl239QOwXmK+fT9FERBZgQ
 U/XAi0disScILHEj0l4dz2jXOme7O5fLFvPmyKaeejagS3itrvNeJJcRc2+4dpjImPFRWJHNc
 /IkUF5zF8V8o5hoeCrzWgKstk8GH7etJPXuk2rRzzk00cisEEV6Yv5BH4npDhNo2zcarRbAAI
 BCEERLhC5HC5oqkhHWbPCNcpA8GA3+mK9J4aFfL+FGm1OOGvxK0JK6WmLWP9uc0hV5MKV8FV4
 ejH9blWGYOQpxgr8CHd7/ob5CbGNuXakMf5aydjnSBCS+wMtahptG66BNeV2wslTKc+4I+Xys
 IWPlrSGg6wZBWLXad9P3lTssCMcbxJhboso1l1EuXlaj4C3Z/TLtaz0sYmUfCGhPyBEoqks0K
 UsdttxyNV9sv2WYmuL8E0G38gWh+/n2AndkRbl6gQzWnaUU2C4C8lzMc6gHYD9M67FJmlPBV5
 FKu72MTHDD7Q4KHSfh/Vi8NTRwHZAwowuHvAUJOayU6ZYjc0OcX7S8tq4qwaAMqWh0mbRp7Zu
 wDPkW4MCLwSiornqvmB71cAp4VxfHBHgUPEoA/ZtqdtnJGNR3uTRYEvUj2NfvFpi/8x1aGl6t
 vFfK7Zbk5hvpKRY1ftYMgKXagQVvrPGpPWmoAKyezuG7Wz2tZGkg55oOq+ymSy26wNiBJINRK
 tgyk4KGc1Bd4TJILMOZalhrYYXZoikCEg/9X/IUdrbc8CmqkDUSnknRmXfZjF8b6B2kqNkvHX
 4YDpG7QxOY2W+AU+HalysiTdAEEf150jFgWYYe94amoCzN+Yp+KAYn/IAdZRGih2afSx5sEx0
 vzi8+K15YymGBw9lxYTCHVbjV0pBxe65X+YGz0+GodyiirTzUBNU4pVqZHAPMIWtph37EQs1T
 nxUxVKRJLsCnEfZN2jE0nMkY9Vb9A1J4KlA7OG5qzNXIGCaK6fSbvO99V4vmlsCLpaqukf0XK
 wRFV/W5MJqNAPEGfkQFHgcKBzNUjbjQAomnEF/NxOqQdmZ5aTASTxPr4Nj/ZUCmxOBQVpmP+T
 TAH/Z2Qq17OW0dYTQ4rjm5iCgAvcBzxJ4onWsrWokf0K29W2rRfec6/9vv3M=
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 07:40:26 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/arm/mach-zx/zx296702-pm-domain.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm/mach-zx/zx296702-pm-domain.c b/arch/arm/mach-zx/zx29=
6702-pm-domain.c
index 7a08bf9dd792..ba4f556b7a13 100644
=2D-- a/arch/arm/mach-zx/zx296702-pm-domain.c
+++ b/arch/arm/mach-zx/zx296702-pm-domain.c
@@ -152,7 +152,6 @@ static struct generic_pm_domain *zx296702_pm_domains[]=
 =3D {
 static int zx296702_pd_probe(struct platform_device *pdev)
 {
 	struct genpd_onecell_data *genpd_data;
-	struct resource *res;
 	int i;

 	genpd_data =3D devm_kzalloc(&pdev->dev, sizeof(*genpd_data), GFP_KERNEL)=
;
@@ -161,14 +160,7 @@ static int zx296702_pd_probe(struct platform_device *=
pdev)

 	genpd_data->domains =3D zx296702_pm_domains;
 	genpd_data->num_domains =3D ARRAY_SIZE(zx296702_pm_domains);
-
-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "no memory resource defined\n");
-		return -ENODEV;
-	}
-
-	pcubase =3D devm_ioremap_resource(&pdev->dev, res);
+	pcubase =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pcubase)) {
 		dev_err(&pdev->dev, "ioremap fail.\n");
 		return -EIO;
=2D-
2.23.0

