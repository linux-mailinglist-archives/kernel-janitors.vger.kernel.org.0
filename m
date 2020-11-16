Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4773C2B3EBD
	for <lists+kernel-janitors@lfdr.de>; Mon, 16 Nov 2020 09:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgKPIeO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 16 Nov 2020 03:34:14 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:55120 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgKPIeN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Nov 2020 03:34:13 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AG8Y5cd001969;
        Mon, 16 Nov 2020 08:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=bc1Jtu4U6ojxQdJN9tEn8qClCtroAfzUsB9+z9NVLUU=;
 b=nvVSx8nwl31OAqCp+KVlT6/f2t5/vs98wvSZNFJAo8Knq7/VDbXo/5uCQbVYDbLuyZ2U
 /V50m0wq4Z303XBaLQ+2cBAX70Ej6aRTijy/WDcfmM4FxyZKxwV65LBR1F/a2z9ZNk7W
 q5byUGaEOx9ECYa98WSidf9KewmfPZpzKleQsF8yNgswNpOxHzivY3+gHgjmPmnqQKH5
 +JbEDjsRW8kvxVl3OYw4WlZ6WanPB9zwifSzFpIOZXhYu/adFbOv4vP9c35DUyUmOoKu
 s+Rv4+xYJlEtGkQ68si6AxGVJ6scv6eE0FbQk7jom0biI9Qy6Hjh9uWfqj3HxSehOLCx sw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 34t76kkutw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Nov 2020 08:34:10 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AG8OSq3140261;
        Mon, 16 Nov 2020 08:34:10 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 34ts5udu8q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 16 Nov 2020 08:34:10 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AG8Y9hf020485;
        Mon, 16 Nov 2020 08:34:09 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 16 Nov 2020 00:34:08 -0800
Date:   Mon, 16 Nov 2020 11:34:02 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Paul Moore <paul@paul-moore.com>, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] netlabel: fix our progress tracking in
 netlbl_unlabel_staticlist()
Message-ID: <20201116083402.GA18329@kadam>
References: <20201113085255.GA91999@mwanda>
 <CAHC9VhQHas2FGcheAaizAHA65pfxa+oz5B88AP9WO4-hPF4kFg@mail.gmail.com>
 <20201114094516.GZ18329@kadam>
 <20201115030023.GA927@Ryzen-9-3900X.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201115030023.GA927@Ryzen-9-3900X.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160049
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160050
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Nov 14, 2020 at 08:00:23PM -0700, Nathan Chancellor wrote:
> On Sat, Nov 14, 2020 at 12:45:16PM +0300, Dan Carpenter wrote:
> > On Fri, Nov 13, 2020 at 09:41:01AM -0500, Paul Moore wrote:
> > > On Fri, Nov 13, 2020 at 3:53 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > >
> > > > Hello Paul Moore,
> > > >
> > > > The patch 866358ec331f: "netlabel: fix our progress tracking in
> > > > netlbl_unlabel_staticlist()" from Nov 8, 2020, leads to the following
> > > > static checker warning:
> > > >
> > > >         net/netlabel/netlabel_unlabeled.c:1190 netlbl_unlabel_staticlist()
> > > >         error: uninitialized symbol 'iter_chain'.
> > > 
> > > Thanks Dan, I'll look at it today.  I'm a little confused as to why
> > > the compiler didn't flag that, but perhaps I just missed it.  Anyway,
> > > patch later today ...
> > 
> > GCC has stopped warning about these for some reason.  Very frustrating.
> 
> Most likely due to commit 78a5255ffb6a ("Stop the ad-hoc games with
> -Wno-maybe-initialized").

Ugh...  That explains it.  These days we have the GCC plugging which
initializes things to zero so some of these don't show up in testing.

regards,
dan carpenter

