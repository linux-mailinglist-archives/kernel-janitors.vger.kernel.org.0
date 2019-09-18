Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F372B6D58
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Sep 2019 22:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391155AbfIRUNN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 18 Sep 2019 16:13:13 -0400
Received: from mout.web.de ([212.227.15.3]:50099 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391137AbfIRUNM (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Sep 2019 16:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1568837565;
        bh=Mp/Sp993s+Pq9hGkpPGsUTRxMV/puPWC2MnlUBBr208=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=McTxWX1al/lp/s/v4ZQeZASdwV2S3pUkuqwKYg3vfs58ism6GECaUM07JPZXvSokO
         6F1PIaw5TTmxdIDlGFT3vHOkmSkzaynlNnjjh9SSJ9FgefBX3V6rn2H6Eauj74jbsj
         haBUQyeFlYEoPq/LgoqYOdfjsA+x6gRBvojCF9/4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.2.101]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Mef0K-1iYxQT1ytU-00OGMb; Wed, 18
 Sep 2019 22:12:45 +0200
To:     linux-serial@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Martin Sperl <kernel@martin.sperl.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <wahrenst@gmx.net>,
        Stephen Boyd <swboyd@chromium.org>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] serial: bcm2835: Use devm_platform_ioremap_resource() in
 bcm2835aux_serial_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Himanshu Jha <himanshujha199640@gmail.com>
Message-ID: <fcb34c72-89c7-9993-fc0a-ba3a61708bec@web.de>
Date:   Wed, 18 Sep 2019 22:12:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Uc/+VrkchqSRfhOA5ddy0dBO+fZXjPD4PJMt88+y188b9L0lizJ
 agNnt9ZTudVLpAOAYtZYeBVq0olzLlcRR4Pm+OBMD0C7vBMc739NthmGujNynfRhXiAbYKA
 auyoYOFRTId4JAyIu3CYumv8mSByvtR5pSlamV0Dzn9+2i56rFUKbKvldQL13TkptAKKZCS
 NxBe8SEdvesR/ovk2Hhtg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7iO9rjYmu+M=:JBqVrv39cTFySguKp38A5c
 hE5Wh9L/pb/2vLlAEM5Vszf0f8lPh9LO23KT8XFk4eEwUjHr3CD/CDSExY7iFpIsk+wuIpu0M
 3TWVDvhLC38ngsN8mybiIZOHC/Fgj/6gN+NpRFj4h/m6ETwECGMpbY484ah8hhWYi0ZV8eeA3
 oJNa1XI7PhUKbqcfMD5sPuEgHTznZwKSRcqP/4UlwHub/N5ELEgvfYO1pwBFSsvNayAWFgCug
 8eHAPu5y+Kk6LTGs9Wrjt912KBpsYHhYjzYye5+5FG9R6ACy8cegZzujf8gDSE0tUk9BvNkmV
 UWwcGydFsuvTel5AWAIVCN8uMwGqZaxA7dtRaEfBycqO6E2akgwfT/lfBeWYL7I4it+eCVsAn
 N94abohs2GlQTgOEqRtUpyxjmVomtf0hLDw0R9paGuyz/wPc0ReZrMEJKjPB1lCoamx/CApcI
 baSKIEElcpgtswhrnPe2EEPn/wGq8aB0g+s3OwL6mjAJEll9JO65HC2e05Ytlyvt/NLiivs4/
 31HMa6SvF53YNxRkYn7c/7QMwFy9gFRjfXUJ1ektZ7fBjs2FrT+qUoAudoERlOfYMAjD1GTgc
 nA8X3JmVR7bYzDrJaDDmgEmJ6J43orKNcP8bJbS4rqVGdN15Ykh5dgBuJdR0W3N0LO6iwb5rj
 Gnz6rT0wN0h1dOaQRm/1/duJyU2XgLKgKFJnQ+DAQsTjiJ18/Mvp3vTHy1KYGHgrSMiiiOIjP
 6haEZUmZsSUB6I6o322GEVIfNDUqjGL4e9Q59kZxkwmfzh4WBg+bUULjnqRXg2Zxu+CPviuaf
 hmXRDft6SzxWEJgMHJTYKBbVytv4sSX5l7T5cZTIKyGjizIARHM8c0PQVLCYY6SI5tGce/DR1
 LBrupDlfmFs8ToB1bWmFTACnijZtPSbT2Sb0+twW6XS8R8hBVWD7/2xKp1oFFBgmYthcqLPJD
 +nJB4H6yS9m5uMaUnxnDpVjB/jwK13Gt38JK7YsS8I76mLQnPbhSt19vvqtHHqD4wzbtF0zWR
 i+HOxW3jsNssHTeugDe2ou2DGGimctXzjT+F02COtqgOHuZVkLi1Zn1aKbskrohAOjIFW+Dyx
 oPdva6F8jNyGxdMzGCtPnOcawy47ZokOgk2oYL7zgP9yctG9wy43djOoQAyUfKgYHzF++CAGo
 D32A/hDwJY5oFajzQ8MqbcxBiz2rfA7XBSMN0SmBfZROMH8GU3Mk1HaAXV9ewNx0+/KULLyUg
 5yuvr0w4SPxPwamELrldzjKSqBvUwgvW4s+LvSnqlvcvfM6WNqM5WzwzDHQk=
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 22:00:14 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/tty/serial/8250/8250_bcm2835aux.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_bcm2835aux.c b/drivers/tty/seria=
l/8250/8250_bcm2835aux.c
index 8ce700c1a7fc..e2c9d19fc8e9 100644
=2D-- a/drivers/tty/serial/8250/8250_bcm2835aux.c
+++ b/drivers/tty/serial/8250/8250_bcm2835aux.c
@@ -25,7 +25,6 @@ struct bcm2835aux_data {
 static int bcm2835aux_serial_probe(struct platform_device *pdev)
 {
 	struct bcm2835aux_data *data;
-	struct resource *res;
 	int ret;

 	/* allocate the custom structure */
@@ -61,12 +60,7 @@ static int bcm2835aux_serial_probe(struct platform_devi=
ce *pdev)
 	data->uart.port.irq =3D ret;

 	/* map the main registers */
-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "memory resource not found");
-		return -EINVAL;
-	}
-	data->uart.port.membase =3D devm_ioremap_resource(&pdev->dev, res);
+	data->uart.port.membase =3D devm_platform_ioremap_resource(pdev, 0);
 	ret =3D PTR_ERR_OR_ZERO(data->uart.port.membase);
 	if (ret)
 		return ret;
=2D-
2.23.0

