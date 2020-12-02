Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91E3B2CB72D
	for <lists+kernel-janitors@lfdr.de>; Wed,  2 Dec 2020 09:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728830AbgLBI3K (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 2 Dec 2020 03:29:10 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:36054 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgLBI3J (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Dec 2020 03:29:09 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B28J4cl159262;
        Wed, 2 Dec 2020 08:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Cnv7h+z66mzSzDGeCdajbB/GzSuanBp+Js5qEmul55o=;
 b=gxTGhQPREmIEwMG2PmWJ0VZeoDCxoyTLhmp5gUmadwL84QlgAZkjpV+6XhZEtEYU2iPd
 N6f4x6pHyP2pVg1i/C50YSuodqMpWQecxtSmKQ1Z2NjkeGTJhfhkrNFa+AmsVTR8dXGQ
 BknQ87LfOaGyALkBpDsJSnqwiXSZraoX245wiwi/pk8jjjj4bWWkivJA64ICmncUyj7o
 3963hn31DwYukYAkTgq99dCPcvOtqRdODaErOCWicwnPvDDP4c7fTID+Ou74GjPia+Mo
 xNSYvbd1mVbbwDfY6k54gkPv7Z/+PecRGB7AEGJArOcvUZI7DvCWzl1iRVKIzen5tO6h AA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 353egkps1d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 02 Dec 2020 08:28:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B28LMZD024399;
        Wed, 2 Dec 2020 08:28:25 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 3540fy9ntw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Dec 2020 08:28:25 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B28SOqD026915;
        Wed, 2 Dec 2020 08:28:24 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 02 Dec 2020 00:28:24 -0800
Date:   Wed, 2 Dec 2020 11:28:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Staging: rtl8723bs/core fix brace coding style issue in
 rtw_ioctl_set.c.
Message-ID: <20201202082818.GO2767@kadam>
References: <20201201214915.GA397311@a>
 <20201202064223.GN2767@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202064223.GN2767@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020050
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012020050
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Dec 02, 2020 at 09:42:23AM +0300, Dan Carpenter wrote:
> Don't put a period at the end of the subject.  "rtw_ioctl_set.c." If I
> were reviewing this as a real staging patch to be applied, I probably
> would not comment on it the first time you did it.  I try ignore trivial
> stuff like that.  But since you are going to resend the patch then you
> may as well clean it up.
> 
> On Tue, Dec 01, 2020 at 03:49:15PM -0600, Brother Matthew De Angelis wrote:
> > Fix a brace warning found by the checkpatch.pl tool at line 178.
> > 
> > WARNING: braces {} are not necessary for any arm of this statement.
> > 
> > Signed-off-by: Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
> > ---
>   ^^^
> These three lines are the cut off line.  If you put notes after the cut
> off then the notes are not include in the final commit message.  That's
> the normal place to put questions and comments about the patch.
> 
> > My apologies, I meant to sent this. 
> 
> Ah...
> 
> > Would a patch like this be worth Greg's time?
> 
> Again, this is a situation where Greg will probably not take more than
> 15 seconds to review or think about your patch.  It fixes a checkpatch
> warning and doesn't introduce any new issues.  Apply.  I review staging
> patches as well and I follow the same philosophy as Greg on this.  But
> often other maintainers have higher standards.
> 
> And it's always good for you the developer to take more than the minimum
> 15 seconds to consider the patch.  There are several other "WARNING:
> braces {} are not necessary" checkpatch complaints in this file.  You
> may as well fix them all.
> 
> There are other things to clean as well.  But they should be done in
> separate patches.  For example, what does check_fwstate() mean?  What
> does it return?  Normally kernel functions return 0 on success and
> negative error codes.  Boolean functions are supposed to named more
> obviously like fwstate_set() where the name tells you right away that
> it returns true when the state is set and false otherwise.

Of course, _set() can be a verb or a question.  "set this" vs "is this
set".  So maybe that's not a good name either.  Naming is hard.  Is it
worth changing?  Pointless churn is also bad.  Anyway, all these things
are stuff to think about.

regards,
dan carpenter

