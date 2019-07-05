Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 408F960B25
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jul 2019 19:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbfGERkW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 5 Jul 2019 13:40:22 -0400
Received: from mout.web.de ([212.227.15.3]:34757 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728046AbfGERkW (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Jul 2019 13:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1562348401;
        bh=3s4zi/KXhlNeymnbYyVzT+9uWHz+szz7bFcSG09ueIs=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=py+g2sQWu41/X3QbIc5sRfl0aTFUE4ihNEtC3xihyNsPJ0KNypiq0P1Yw8OusyR+b
         5aGjlB5h084FnqU8ICC4GiXeVa5/5vvyr7N1SaU0W5LoJbF3bzvxrJkFV8UpWIIJd8
         s3xl4mN2hUm4lwVWLsLhCT2X00NsHNvYH1eEVVEA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.45.164]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MMmwZ-1hawGs1Get-008dCk; Fri, 05
 Jul 2019 19:40:01 +0200
To:     linux-arm-kernel@lists.infradead.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] coresight: etm4x: Two function calls less
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <172e04b2-65a5-4007-8464-cc7701e76e36@web.de>
Date:   Fri, 5 Jul 2019 19:39:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RTKROpMOLmuIHuftSLTu+x2yu721m+pN04wTJ2FGUcWVto/Qy0K
 6cD4ccGWAGdDQfB85sDOmlOdBbgvDbervhDz5iEvtpE5LFyzSihiQMRUFhJBTrSAIaQd9gh
 n+CQbgk1U+3vlrTP92CiET2az/FQh4Gd/782YV5MUywrpDtNNInsCmhXlCm5vetCbOIepRD
 1tmE5wVAfunWNWxhoT+gg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GTOt7FqlfTA=:LB7vqqcy25vCUySAAJF6t7
 CFsbSHGcUlYYfiMhTRQm6T4p2aP/jGr7W3CCj9j3aP1Zrde10V9ut5BQ3E23F5wuuK8yr0hW8
 bqw78McEVpFwcgAeQVAZmr6utU3BXxDD78ope8qM+23remFn9IbGaSC9GIVaPtT28JJ/E90Il
 FK5GnMsRytexIm4A2/KWNussiWWpnNaMNGGE21z9Ihgu0Mp7t30lW2HiuIULE3ZVDGu+XqOM0
 +NR0aBTmo4voTNpM23PxRp0giNzlzYVX/BMMOo270RrUQrUR8+mFXCXGaAO6X2lAjFJgQQ3hK
 0uWXYwCLeNVvJmNvtBsSEeelK2al0eDfkU5aRPxFtemFoj2sXdfC/ue+BRM+nxpIYxR941zqp
 XN/iNaU+QCB5rkOKK61F+tsBFl1dHsYsO/X9d1BtkF6w6sFmOC2SP0kH8/04lRpMySfsDPVgT
 XjpQaEzGESdnmIofkGk8NugUT0z+i7JjEpgVkI6lWZPId7CoGLYZxnazlCjYImpmK+mWkPVhz
 7U0zbMK4fTIXrnCgJuFlBBBCpj2E0l9F0c/qquIVFwyHgYYhgdmP2ZgOQQanXQ2OUJl1ENLXo
 oUPXsNW9et9OTnelsXiV51ZkXW5lh2ss4l0h29/K1mya8rKjy65vG1kWS+J/18o4o2z0mHN+J
 ztPrff0BHS+RBPCqMdW90xiknHbe+4RsgPjO5Czfv3OO+TVxdcM+hnYtQe8tzahawReKyVn5o
 Zj4VvYZ5LdpZCh4LlUByJwzeWuluN9UwJGBC2eQ6gNmHkJ2LdIR7S665r26aSetbno7C/RDmJ
 MvOhzLWpmwQoOktgE81Hm4WbQDvdW7djMhlRK+aqhpNNiElsceziCK3wjjNSZiWTNLWasZFHW
 62vV0HhgcHlEMv4jh+l6L1c8UhZLjZeD3VY5XpdL6VQXnP7i9BhqbeCnNrqAnYhRjdYV0A4Hp
 IFq5Pqkj+o6SFUKxpvfrivARbVvH9s+eoca+8C5NmVWC4cs4cEksMsMkAfUY5d4zIYA0Zb3v0
 bL+/VTnIU2Gvc1gsQPcQsqbyUnzlHkXNdeRfEDHOkWofJ3vyVEQAqjpCwRoIHFVkqZ7e3Ryac
 sLVimzHiZrK00KbDkiJHyr+Iz/nYpMPU4Ey
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jul 2019 19:33:26 +0200

Avoid an extra function call in two function implementations
by using a ternary operator instead of a conditional statement.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers=
/hwtracing/coresight/coresight-etm4x-sysfs.c
index a0365e23678e..219c10eb752c 100644
=2D-- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -296,11 +296,8 @@ static ssize_t mode_store(struct device *dev,

 	spin_lock(&drvdata->spinlock);
 	config->mode =3D val & ETMv4_MODE_ALL;
-
-	if (config->mode & ETM_MODE_EXCLUDE)
-		etm4_set_mode_exclude(drvdata, true);
-	else
-		etm4_set_mode_exclude(drvdata, false);
+	etm4_set_mode_exclude(drvdata,
+			      config->mode & ETM_MODE_EXCLUDE ? true : false);

 	if (drvdata->instrp0 =3D=3D true) {
 		/* start by clearing instruction P0 field */
@@ -999,10 +996,8 @@ static ssize_t addr_range_store(struct device *dev,
 	 * Program include or exclude control bits for vinst or vdata
 	 * whenever we change addr comparators to ETM_ADDR_TYPE_RANGE
 	 */
-	if (config->mode & ETM_MODE_EXCLUDE)
-		etm4_set_mode_exclude(drvdata, true);
-	else
-		etm4_set_mode_exclude(drvdata, false);
+	etm4_set_mode_exclude(drvdata,
+			      config->mode & ETM_MODE_EXCLUDE ? true : false);

 	spin_unlock(&drvdata->spinlock);
 	return size;
=2D-
2.22.0

