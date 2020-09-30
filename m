Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B91B27E889
	for <lists+kernel-janitors@lfdr.de>; Wed, 30 Sep 2020 14:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729205AbgI3M2N (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 30 Sep 2020 08:28:13 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:54582 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727997AbgI3M2N (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Sep 2020 08:28:13 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UC9YhR028137;
        Wed, 30 Sep 2020 12:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=g14+JbAXNUIDOSumYRcqglsnIcYylhw2m0sA+ZnTuX4=;
 b=IjdYEN1bVdBp3T8f3BZ+ye19TY732TkCur5PHaCZDHBcMBULxubjiugSeFTrj7lI/nhx
 ZZ9v1rf5L1X6EnWiPMR1ddHVH2DW+O383apYD7hSuWFPHHRworlst6V0vD9J684Aw8VS
 g53npCiBTWSoDv6oyWdwUGS4mRoh6BbPdAvZYj0yIG0dz6fYqVT+6IjXZsk2iPFdrNrM
 Jl59gTbABfWE0GsAQzdpPbVRONwgXbSzhqh1Tc9WfSfdpsIyFL1FuIrpuI5srGnHzwUD
 pCVq2j0iK1h96UrxEbjILqTGiKCBNU9pAEdy4AaIzZJcT2yd03GhIiNiGt+wottZAK1t aw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 33swkm06mk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Sep 2020 12:27:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UCOl96156864;
        Wed, 30 Sep 2020 12:27:58 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 33tfdttusg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 30 Sep 2020 12:27:58 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08UCRnFl019263;
        Wed, 30 Sep 2020 12:27:50 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 30 Sep 2020 05:27:48 -0700
Date:   Wed, 30 Sep 2020 15:27:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marcelo Diop-Gonzalez <marcgonzalez@google.com>,
        kernel-janitors@vger.kernel.org,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        Jamal Shareef <jamal.k.shareef@gmail.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH] staging: vchiq: silence an uninitialized variable warning
Message-ID: <20200930122741.GB4282@kadam>
References: <20200930090238.GA621698@mwanda>
 <CAK8P3a1m3kaGK17A2ADgA7b9i7GeEYhX=xVoU=Yet8_T93Q2JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1m3kaGK17A2ADgA7b9i7GeEYhX=xVoU=Yet8_T93Q2JA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009300102
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300101
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 30, 2020 at 12:22:37PM +0200, Arnd Bergmann wrote:
> On Wed, Sep 30, 2020 at 11:02 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > Smatch complains that "userdata" can be passed to vchiq_bulk_transfer()
> > without being initialized.  Smatch is correct, however, in that
> > situation the "userdata" is not used so it doesn't cause a problem.
> > Passing an uninitialized variable will trigger a UBSan warning at
> > runtime so this warning is worth silencing by setting "userdata" to
> > NULL.
> >
> > Fixes: a4367cd2b231 ("staging: vchiq: convert compat bulk transfer")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> The change looks fine, but I wonder if it's actually worse and the
> uninitialized pointer can end up getting copied back to user space
> in the completion.

Ah... Wow.  You're right.  I think I really need to resend this with a
more accurate commit message.

regards,
dan carpenter


