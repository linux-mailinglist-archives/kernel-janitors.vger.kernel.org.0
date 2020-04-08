Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46F8E1A1E29
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Apr 2020 11:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbgDHJnI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 Apr 2020 05:43:08 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:53960 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgDHJnI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Apr 2020 05:43:08 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0389gxG0035628;
        Wed, 8 Apr 2020 09:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=pfbOx4SuCHGha5hDNifqmWM9Bh4xEKLvK91mqe/gl94=;
 b=BS2ecafT+QsoDMtQkcBjnHV71WEpRlmhhxZHjihNOu/D+kC8R8MVu6TVFYhg7ssM5E4p
 74MlNW+gwSo9/OdJjz0XcokMzRa+2m3hE9eSVIVLei1KfdBH/E9gKI6QiQ4iNsCnRQQq
 SXyDDM9Dsw5PvWUVZATBlO6zCDqBKoiShWefv+gYi4uoKNhOZ3aoDD6geanCK/OyHy5e
 pLUlhlS4XsYhHKiogDkn418sUTWBc71R+lJkjSKf1x8IzKnkCzOr2lJU3c874zrp/sPp
 s6p+ZcsPo0s19zquxJCxGLP6Gui4Mk/dGQ/WC/ftr8pL0uY0mm5Pes3lB8Yz+w9ZrZCI iw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 309ag38nua-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Apr 2020 09:42:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0389fXKJ132792;
        Wed, 8 Apr 2020 09:42:53 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 3091m38ksk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Apr 2020 09:42:52 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0389gpau022169;
        Wed, 8 Apr 2020 09:42:51 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 08 Apr 2020 02:42:50 -0700
Date:   Wed, 8 Apr 2020 12:42:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        kernel-janitors@vger.kernel.org, Joe Perches <joe@perches.com>
Subject: Re: [PATCH] gpu/drm: ingenic: Delete an error message in
 ingenic_drm_probe()
Message-ID: <20200408094244.GM2001@kadam>
References: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
 <a0a0c054-f71e-a23e-ba47-c1f6554b79e6@wanadoo.fr>
 <alpine.DEB.2.21.2004051948120.3208@hadrien>
 <9549b4a1-5874-5f00-6237-d5f5161e9852@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9549b4a1-5874-5f00-6237-d5f5161e9852@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9584 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004080080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9584 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004080080
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Apr 06, 2020 at 07:48:52PM +0200, Christophe JAILLET wrote:
> Nevertheless, I wrote another script (see below), which triggers ~2800 times
> in ./drivers only.
> Some are false positives, but most look valid.

I did a quick grep and you're right there are a ton of these!

> 
> Not sure that fixing this kind of stuff really make sense.
> 
> A better approach could be to teach ./checkpatch.pl, but I don't have the
> knowledge for that.

Yeah.  I think so too.  Here is what I tried.  $logFunctions ends up
catching too many functions like process_mcheck_info() so maybe we need
a stricter regex for that.

regards,
dan carpenter

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index d64c67b67e3c..1bcfa9e18059 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5493,6 +5493,13 @@ sub process {
 			     "Use of volatile is usually wrong: see Documentation/process/volatile-considered-harmful.rst\n" . $herecurr);
 		}
 
+# check for missing newline
+		if ($line =~ /\t$logFunctions\b.*$String[,)]/ && $rawline !~ /\\n/ &&
+			$rawline !~ / "[,)]/ &&
+			$line !~ /debugfs_/ && $line !~ /MODULE_/) {
+			WARN("MISSING_NEWLINE", "Missing newline?\n" . $herecurr);
+		}
+
 # Check for user-visible strings broken across lines, which breaks the ability
 # to grep for the string.  Make exceptions when the previous string ends in a
 # newline (multiple lines in one string constant) or '\t', '\r', ';', or '{'


