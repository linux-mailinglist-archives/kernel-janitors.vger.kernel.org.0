Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE632CB52F
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Dec 2020 07:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387417AbgLBGnN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 2 Dec 2020 01:43:13 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:34538 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727529AbgLBGnN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Dec 2020 01:43:13 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B26PU9r141980;
        Wed, 2 Dec 2020 06:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ObjBGPFvGSWWj5nteuReLToaMYyLoL9M/o/4tiYkOS8=;
 b=TwSPCiwQCvtjRkE0xKnNK4QvCX5vst/CXrS5WIGOEizi3Gjtq1Q/z4atLYEs76+Z57X8
 kdhY5CMpLufBj8ERvgHllcsSBb/QhViVZ7dOmusq9L5kySpBE7UNYaOsH+y9btyHvGFb
 qkenDNWishIELVwUGIx4QIVZlYkQ8s3l4HQGDDgTsY8UjeqiakLNSSzHDzqP4/MutbxC
 /QlNQvutmvwGn27JBxnupOXeuhTyiKcXK/62zHbQkRJF/cTiBIuh7ewUARzn2LxiFR66
 QOq5WDeGb7TLv0XzOfOQS6DcqMXpwEmSwVoNO6jPyU6uGQreGawNVBRmQ536pyOILg4f iw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 353dyqph21-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 02 Dec 2020 06:42:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B26PL5d091338;
        Wed, 2 Dec 2020 06:42:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 3540fy51jw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Dec 2020 06:42:29 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B26gTiH020004;
        Wed, 2 Dec 2020 06:42:29 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 01 Dec 2020 22:42:28 -0800
Date:   Wed, 2 Dec 2020 09:42:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Staging: rtl8723bs/core fix brace coding style issue in
 rtw_ioctl_set.c.
Message-ID: <20201202064223.GN2767@kadam>
References: <20201201214915.GA397311@a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201214915.GA397311@a>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020039
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020039
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Don't put a period at the end of the subject.  "rtw_ioctl_set.c." If I
were reviewing this as a real staging patch to be applied, I probably
would not comment on it the first time you did it.  I try ignore trivial
stuff like that.  But since you are going to resend the patch then you
may as well clean it up.

On Tue, Dec 01, 2020 at 03:49:15PM -0600, Brother Matthew De Angelis wrote:
> Fix a brace warning found by the checkpatch.pl tool at line 178.
> 
> WARNING: braces {} are not necessary for any arm of this statement.
> 
> Signed-off-by: Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
> ---
  ^^^
These three lines are the cut off line.  If you put notes after the cut
off then the notes are not include in the final commit message.  That's
the normal place to put questions and comments about the patch.

> My apologies, I meant to sent this. 

Ah...

> Would a patch like this be worth Greg's time?

Again, this is a situation where Greg will probably not take more than
15 seconds to review or think about your patch.  It fixes a checkpatch
warning and doesn't introduce any new issues.  Apply.  I review staging
patches as well and I follow the same philosophy as Greg on this.  But
often other maintainers have higher standards.

And it's always good for you the developer to take more than the minimum
15 seconds to consider the patch.  There are several other "WARNING:
braces {} are not necessary" checkpatch complaints in this file.  You
may as well fix them all.

There are other things to clean as well.  But they should be done in
separate patches.  For example, what does check_fwstate() mean?  What
does it return?  Normally kernel functions return 0 on success and
negative error codes.  Boolean functions are supposed to named more
obviously like fwstate_set() where the name tells you right away that
it returns true when the state is set and false otherwise.  Why is there
an underscore at the start of the _FW_UNDER_SURVEY name?

There are other ways we could write the if statement like:

	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		goto handle_tkip_countermeasure;

	if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		goto release_mlme_lock;

All that stuff would have to go into different patches, but it's worth
thinking about.  But if you're going to resend this, then please fix all
the "braces are not necessary" warnings in the file.

regards,
dan carpenter

