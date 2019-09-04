Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 827BEA8328
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Sep 2019 14:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729821AbfIDMot (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Sep 2019 08:44:49 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:53218 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729594AbfIDMos (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Sep 2019 08:44:48 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84CiAdp066772;
        Wed, 4 Sep 2019 12:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=9aPoIL9pO6gE62BiC2uWQJGmxnxCOgq0bXNSgJqqMCA=;
 b=Bv1cwKsmB3/3oIIt3Xq72s4af6N5blG4vdUcPRy9avry5cH9R+UpnoDry6Egy5idgZXR
 30QOl4K3JrqotRG5snEU/amCimwC5oNrxi4tHxxfxyhRXTX6Wk1SFT7b3R9dcznFtkZZ
 bB4k+qgLVTlZSxp9oFGmSZru9EuZdGnyM5thqNkRNN2QVcKFafrbsAqk87jXSUNOhCMW
 AYfIl6oEqxuXI1Exq1r+YF7xuJsOsx+9KyQ9rc4WEDmyEObg5AbV70NgOhNxqn94RzbJ
 pHinQ1Ps+4l1Z1+DgOXFV8x5X65KrRHRPpZqGCngPV2myjaYBgXnP5XARlktyCO94M7S BQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 2utdcyg1xe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Sep 2019 12:44:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84ChHHa096176;
        Wed, 4 Sep 2019 12:44:35 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2usu51tkpk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Sep 2019 12:44:34 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x84CiWFP006982;
        Wed, 4 Sep 2019 12:44:33 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 04 Sep 2019 05:44:32 -0700
Date:   Wed, 4 Sep 2019 15:44:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Chao Yu <yuchao0@huawei.com>
Cc:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] f2fs: signedness bug in f2fs_fname_setup_ci_filename()
Message-ID: <20190904124424.GA3115@kadam>
References: <20190904100239.GC7007@mwanda>
 <29accb39-1ed7-ab3f-4783-9a07836db8e3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29accb39-1ed7-ab3f-4783-9a07836db8e3@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=936
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909040127
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909040127
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 04, 2019 at 07:43:07PM +0800, Chao Yu wrote:
> On 2019/9/4 18:02, Dan Carpenter wrote:
> > The error handling doesn't work because "cf_name->len" is unsigned.
> 
> Dan, thanks for catching this, would you mind merging this into original patch,
> since it's still in the dev branch. :)

I don't mind if you fold it into the original.  That's fine.

regards,
dan carpenter

