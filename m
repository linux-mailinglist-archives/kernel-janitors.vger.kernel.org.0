Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71871136779
	for <lists+kernel-janitors@lfdr.de>; Fri, 10 Jan 2020 07:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731584AbgAJGgt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 10 Jan 2020 01:36:49 -0500
Received: from smtprelay0095.hostedemail.com ([216.40.44.95]:56697 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731530AbgAJGgt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 10 Jan 2020 01:36:49 -0500
X-Greylist: delayed 581 seconds by postgrey-1.27 at vger.kernel.org; Fri, 10 Jan 2020 01:36:48 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 6694A182D3512
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Jan 2020 06:27:08 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id E21E4180373D9;
        Fri, 10 Jan 2020 06:27:06 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::,RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3350:3622:3865:3867:3868:4321:5007:9592:10004:10400:10848:11026:11658:11914:12043:12297:12438:12555:12740:12760:12895:13069:13311:13357:13439:13972:14659:14721:21080:21627:21990:30029:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: toy15_5b0c212218c48
X-Filterd-Recvd-Size: 1718
Received: from XPS-9350.home (unknown [47.151.135.224])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Fri, 10 Jan 2020 06:27:05 +0000 (UTC)
Message-ID: <845b26cae6396b50f78df45504a6014780b1d3a1.camel@perches.com>
Subject: Re: [PATCH] regulator: mp8859: tidy up white space in probe
From:   Joe Perches <joe@perches.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Markus Reichl <m.reichl@fivetechno.de>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Thu, 09 Jan 2020 22:26:12 -0800
In-Reply-To: <20200110055252.rvelu4ysvoxsbmlg@kili.mountain>
References: <20200110055252.rvelu4ysvoxsbmlg@kili.mountain>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 2020-01-10 at 08:52 +0300, Dan Carpenter wrote:
> drivers/regulator/mp8859.c

I suggest also removing the blank line before this
block and adding a blank line after...
---
 drivers/regulator/mp8859.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/mp8859.c b/drivers/regulator/mp8859.c
index e804a5..87986d 100644
--- a/drivers/regulator/mp8859.c
+++ b/drivers/regulator/mp8859.c
@@ -118,13 +118,13 @@ static int mp8859_i2c_probe(struct i2c_client *i2c)
 	}
 	rdev = devm_regulator_register(&i2c->dev, &mp8859_regulators[0],
 					&config);
-
 	if (IS_ERR(rdev)) {
 		ret = PTR_ERR(rdev);
 		dev_err(&i2c->dev, "failed to register %s: %d\n",
 			mp8859_regulators[0].name, ret);
-			return ret;
-		}
+		return ret;
+	}
+
 	return 0;
 }
 

