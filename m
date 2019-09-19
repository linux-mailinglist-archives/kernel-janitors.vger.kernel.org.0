Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D938B78DE
	for <lists+kernel-janitors@lfdr.de>; Thu, 19 Sep 2019 14:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390099AbfISMFX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 19 Sep 2019 08:05:23 -0400
Received: from mout.web.de ([212.227.15.14]:52741 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390086AbfISMFX (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Sep 2019 08:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1568894681;
        bh=XqLwPBm6k/DOpsT2zClkkvly20Eiqu43FoeN6TCgwUc=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=gDRsNW/uEXN/4DlsHCf+oMM2eyLNzD/TsD2qbWZet6tjPrbMu3/AoR3sxxoUMVbej
         5Vfc9LBamlGV7LZhoSCo+ifVPFVx2tna8nXDY5FmnDgGnF9cNv3AeiVIvsNWsZ/UMx
         BZy1QLL9tos5DfuUqXNqdjXRdPutBYzfNKDMeY7k=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.191.36]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MTdS4-1ibDT71Io4-00QOy2; Thu, 19
 Sep 2019 14:04:41 +0200
Subject: [PATCH v2] mtd: st_spi_fsm: Use devm_platform_ioremap_resource() in
 stfsm_probe()
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Allison Randal <allison@lohutok.net>,
        Armijn Hemel <armijn@tjaldur.nl>,
        Brian Norris <computersforpeace@gmail.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Himanshu Jha <himanshujha199640@gmail.com>
References: <e1d32aa4-7c82-64e0-b7c4-33c94d9a2769@web.de>
 <20190919111014.6c569cf3@xps13>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <eec0774d-135b-2b19-2595-7a126341c77c@web.de>
Date:   Thu, 19 Sep 2019 14:04:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190919111014.6c569cf3@xps13>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8McC+dHy4ZYmY1ktDGalc03+f442zOOtOaZUsfXrlCEwuCNDLtg
 X+8nunAIjpv6B/X1Xs+gmYT3Y+S1eS3t84HPDdzivx6nC27PBHEGzaomV6AWeA1Oop0M8V8
 8+hF7jJLRuJ0VKnjKti59q1Q9xLI5cwhkvk6N5vcVVX7lBEN0GquOx/FuprF3BY1sspgWXS
 U1+2DK0CFOyNvnD3v4ClQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q/ZJdiLLJ/I=:qDgNi9Xsqi6lvpzTK1J4NX
 /Xw29BNwG+IQv58y/VSSP+EFNCWRej0KVce/KwLELjHIzaL0vkyFmnyrPYjHjcibkrpPwpGyD
 RC3U3K8EgKw67ABgkgRD28Nh0arjVtciS5LpEBgYMYe7ZX1ig3QJtNhsaxBqnu6nZUpejTOib
 WQsljvWM+zjeS95UQvOlGG320ufpZ0YXO4CNPjpex9EHg5tOObPEV72QoB184Jg8hYVVETt4a
 CUkDWFbu/YQB9KrGCMLD3yVrksPNPuOM3yeV/Eklk45y4X2stLHEmyN7ipQm6/o7Bo/O/J9Mg
 DOyx1ncfk6vy1P+2TwC2mHnV6/HmYjcnf6iKZlcbrORI7EDqsnMF3pEqwG7fnbV7V3vYoINt6
 b4srWcmfbiyCQz/0+rmAwfjEWCzHq1dwe31fllOIukds8HkJslwNhlMnsymcWQdKd2tS4yy+D
 ABQ2q4b7HehX5sP8RNUGK8kAvKc7iPlv9ly2z2ylZsyhimiengfdcxaEsFs4m9+feZOdj52Yl
 7ByQz1zwxyEoJ+YnKl0ZORK4CiHuhgTvlQpqr8nnc4J3wge/SyV8c9C7Vpi/zi+YBgXp+7OTN
 yf68XF6ysKwwga5XXDvoXfe5VgF0Ldvq+zGutbT16K9ovtl6igCyeEiqJUkb11N3ZfzeOHyDp
 oHwcxmn5pmn3Z+qA+erLIEf8SQz2us+0PfWKU9THoHluWUgPJJYQOdUnHZhy6n07ATf7j3EWT
 YgZvKapJ+SVIMpNkzL0RFQmRBPY6WSi2J0QDNn8LrLugtF/5ze9BspOK2TA1RZ0jarghmERV2
 CqRQJ8XWfNjYveOVIjNgJZrx2UvBSTqiyP5IwqM6JzPRFc3mHFSbTDsVudEi73SgfGkrZlBR+
 K584HoA/VTvIMAihq2Ijuq4q5MfJ2ndK08hFjMHwpI0e+kaq5D/jGnH2M/lOnIxYart5jAaLX
 oOtqViuFXcBhhRGOVcJjkaTAF3BJAKt+6GbB5n1ZwHMpGEIUEV74Bzz13sSYW8zdNWYAzlseu
 61310DFBVoFD2Tz3aUymi9PsSH9vsKhtCfNxSTtDMV9ISrk18NfqBeLuCTWrBkvg7jDOkh1kf
 qiVErU6A1ntJ0XOAG+0gNmpVo4gaUIsPCfQRBi+dz+WOCTOyG9OUoCAE6p+koqv+MjKDxABvo
 5jpgRostS0t4nldr7ULMcnT6Xee2SmN9erNb40QCXqvslxIF3JjkP5PDrNzaQNlb7yAZMVO05
 3mYaJZFj2bIbb5vPqJOBm2qliI+ENSjIFk/vZWSRoaUKREBipDR+Wp9Q0ZIo=
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Sep 2019 13:30:51 +0200

Simplify this function implementation by using a known wrapper function.
* Thus reduce also a bit of exception handling code.
* Delete the local variable =E2=80=9Cres=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

v2:
Further changes were requested by Miquel Raynal.
https://lore.kernel.org/r/20190919111014.6c569cf3@xps13/

* An error message was adjusted another bit.
* A variable was removed.


 drivers/mtd/devices/st_spi_fsm.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi=
_fsm.c
index f4d1667daaf9..ce18198301d5 100644
=2D-- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -2017,7 +2017,6 @@ static int stfsm_probe(struct platform_device *pdev)
 {
 	struct device_node *np =3D pdev->dev.of_node;
 	struct flash_info *info;
-	struct resource *res;
 	struct stfsm *fsm;
 	int ret;

@@ -2033,17 +2032,9 @@ static int stfsm_probe(struct platform_device *pdev=
)
 	fsm->dev =3D &pdev->dev;

 	platform_set_drvdata(pdev, fsm);
-
-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Resource not found\n");
-		return -ENODEV;
-	}
-
-	fsm->base =3D devm_ioremap_resource(&pdev->dev, res);
+	fsm->base =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(fsm->base)) {
-		dev_err(&pdev->dev,
-			"Failed to reserve memory region %pR\n", res);
+		dev_err(&pdev->dev, "Failed to reserve memory region\n");
 		return PTR_ERR(fsm->base);
 	}

=2D-
2.23.0

