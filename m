Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BECFB45E19
	for <lists+kernel-janitors@lfdr.de>; Fri, 14 Jun 2019 15:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbfFNN0l (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 14 Jun 2019 09:26:41 -0400
Received: from mout.web.de ([212.227.17.11]:53663 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727696AbfFNN0l (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Jun 2019 09:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1560518786;
        bh=orRZVCK9YcOmIwIuQgx6bDPIBrUSdVNgbn/CD0479/s=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=joNNbrYMgO2+gLlwAIQB5nyuKluGF+UJrGEBUxxsmty7nZvgLEj28ztRFa9nW3Pel
         EjHOjC6dVwzLvfGULPv7qZMNluPnaQPRaA2yFvjrSROzYzLVJVHIsOcp4NAwVWwJiO
         SwMNWXUzJ6ecuN4oi5TxAz9cHcavFs9ZGEW5qVTg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.126.132]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MTh2S-1i2D4c2Q8O-00QRu4; Fri, 14
 Jun 2019 15:26:26 +0200
To:     kernel-janitors@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Enrico Weigelt <lkml@metux.net>,
        Himanshu Jha <himanshujha199640@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drivers: Provide devm_platform_ioremap_resource_byname()
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <39e46643-d799-94b7-4aa5-d6d99d738f99@web.de>
Date:   Fri, 14 Jun 2019 15:26:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nSbE49bGbCLEB2cl5GT6Q/xRKC9owj7XtgKt2kqRdPv/qsbtNpa
 DrEEG+sZcPNjDCigpX9KyGqIMKsAsw/ecn6zT1vHbCSitonEhfS10mQM9hrs5K5WZqAeWFW
 fXVNiccM2BlR9l2Tui8HqN9GKk5VTFiVWEWqgE+uchDU+1gF+1WqoqarGHMbr98ZAZBN5Oo
 HDFQf/H6dv3eDmRDBFQKA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/QyrgAyN8Fk=:RByacVeZzHHLmjitwWWSOM
 /tKh3f7MUUK8Ma2glQKLyodhNJRI3ohKeUTPxhGGTTuPop7DlfXyEyG1dZUt3yJiSAbTdGqDt
 rh5OD74zzf4Vf0AeQnceHRONbQiyg/O1cwM1fHD6Oh4onNmseJmwzqaogb2+rSsJDc4zusy3Q
 NzRuCFyxTtHqJHzCF6x6+lJ3sxWINmqYP2IFOIhytfLie72wYqed5qrfnqevwDHvCjpj8WRYW
 5+sV+CZlv/DKlUrZvouthK9sskb3AhlGGxuES0leQyV3xNYlmKJ/4ufZFGf61XmihR3wKcLM6
 /OvYviOYXbNc6GH4gW7n0j1P5LLJYshsQAjBeFbQWGsuE14GJD/8TT7sNnLzIl5Zrp/f5s8hg
 wmvMf8dD7TDajXTOYaOyY5GJtuE4VUoaWdAgh4GUesSEMQ33qHD4MUccL8Q3Xk58HLScITDqG
 et2zp6ugT2ecCQcdlKMFDRgQoHkGy3/QMX+rSWc7FqnjFJGZFxJhvSqGdynKoQWLeHWVXETbG
 yj2zMzDvYa3bqKuNIH8jOlkpgxI1qf6sVjvtd9nnsbjevYb/sDJKsmvwAMzqaH2dUA73s8XxP
 DRLDtQl1OqY9NNYdzYPJ7VGOZrbkR50kbgZqU5NPk15CmCjsbB2gWCSQtNmK+2qQNvriD6bWF
 0Cs8vStbDxSoUkEbPMvMyO+u/64J2rBO3DVeERza9rzpcvF6iwi9cRiBYi7zMupQLjLw26bJY
 37lP+d4jnqnEjdD76nF576IUkPhN9Bb5o0pv0Vt/ZqLPNO5hTVzoVr25H7PX8gHQ4FYqapY23
 gko++jU33Xev7ZKegQa9pJ8sv2Xz8ii2Bl94i4KtEcCfFe1cUsY8PkMdlZrWXxwReIcXnA18V
 RKe/LBbPCTtoQiUamqzD3um5MmgCwcOFn1BRIrQKahqc+1qw2IxnEaOWx5mv0z2/T5Grmep95
 sofB57Sb5RaoTLJFtmn2J6HMcnEbqhcAkfgN57zZe9eRmxb3zywCM
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Jun 2019 15:15:14 +0200

The functions =E2=80=9Cplatform_get_resource_byname=E2=80=9D and =E2=80=9C=
devm_ioremap_resource=E2=80=9D
are called together in 181 source files.
This implementation detail can be determined also with the help
of the semantic patch language (Coccinelle software).

Wrap these two calls into another helper function.
Thus a local variable does not need to be declared for a resource
structure pointer before and a redundant argument can be omitted
for the resource type.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/base/platform.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 4d1729853d1a..c1f19a479dd7 100644
=2D-- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -97,6 +97,24 @@ void __iomem *devm_platform_ioremap_resource(struct pla=
tform_device *pdev,
 	return devm_ioremap_resource(&pdev->dev, res);
 }
 EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource);
+
+/**
+ * devm_platform_ioremap_resource_byname
+ * Call devm_ioremap_resource() for a platform device
+ *
+ * @pdev: platform device to use both for memory resource lookup as well =
as
+ *        resource management
+ * @name: resource name
+ */
+void __iomem *devm_platform_ioremap_resource_byname(struct platform_devic=
e *pdev,
+						    const char *name)
+{
+	struct resource *res;
+
+	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	return devm_ioremap_resource(&pdev->dev, res);
+}
+EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource_byname);
 #endif /* CONFIG_HAS_IOMEM */

 /**
=2D-
2.22.0

