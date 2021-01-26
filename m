Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21BE530468A
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Jan 2021 19:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389641AbhAZRYK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Jan 2021 12:24:10 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:55168 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732912AbhAZHfy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Jan 2021 02:35:54 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10Q7TBgA155675;
        Tue, 26 Jan 2021 07:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=Ey8PIiiwWn2CVbGpR1CyBjW7yu08hAySgOwNeW7M9is=;
 b=a/puMAySFBpMquWCdLC6Q7QrcPJrSfx8VVF9ORUd5NVXKCszCQZxr9GlknTUDuik8yqz
 ccotepwSg4Vr+BJUf8gGcE3SfunRxhtdS6swW5XuY40olQ5aUl8fDVwtLK2a2wzrUqxe
 MQe99tyI1Q9g5yggkIHf3w8L92X+UOhF63yYQMAZb3Vd3s/7sPVan50vT1xD1s/FFX8r
 q5sVpv9LIT2d1VTMOc6qnw/aE2TUXlCDemAx2tACDQAarkbY8eeCwQbdFdKCPepkBFTp
 XmHaoFxMrZaNvCb44SHPC1QPjZ+SutPlBua2Vkgg6UUtrLcnhTyoA2B/JIHq4Lk2MgcX hg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 3689aagyc5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 07:34:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10Q7V2ao043381;
        Tue, 26 Jan 2021 07:34:35 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 368wcmkujb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 07:34:35 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10Q7YRcu030844;
        Tue, 26 Jan 2021 07:34:28 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 25 Jan 2021 23:34:27 -0800
Date:   Tue, 26 Jan 2021 10:34:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Zack Rusin <zackr@vmware.com>
Cc:     Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Martin Krastev <krastevm@vmware.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] drm/vmwgfx/vmwgfx_drv: Fix an error path in
 vmw_setup_pci_resources()
Message-ID: <20210126073418.GV2696@kadam>
References: <YA6FMboLhnE3uSvb@mwanda>
 <4D85574F-E711-46F8-A517-900F6D18954D@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4D85574F-E711-46F8-A517-900F6D18954D@vmware.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9875 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260038
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9875 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260038
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jan 25, 2021 at 07:13:43PM +0000, Zack Rusin wrote:
> 
> 
> > On Jan 25, 2021, at 03:45, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > 
> > The devm_memremap() function never returns NULL, it returns error
> > pointers so the test needs to be fixed.  Also we need to call
> > pci_release_regions() to avoid a memory leak.
> > 
> > Fixes: be4f77ac6884 ("drm/vmwgfx: Cleanup fifo mmio handling")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks, Dan.
> 
> I have a patch based on your report that fixes that too but it comes with a refactoring. I’d be happy to rebase it on top of yours just to get yours in before. If you’d like I can push your patch through drm-misc-next, if not:


No no.  Sorry, just apply your patch and drop mine.  The problem is that
the report I sent was from kbuild and I do my devel work on a different
system so it's harder to track those emails and I forgot.

Looking at it now, the bug report I sent earlier was only for the
pci_release_regions() and not the NULL vs error pointer.  The kbuild
bot is not using full cross function analysis so it can't find those
bugs.  My dev system does much slower builds so it's a tradeoff.

regards,
dan carpenter

