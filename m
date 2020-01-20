Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6F3142E8A
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Jan 2020 16:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgATPNS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Jan 2020 10:13:18 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:39732 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgATPNS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Jan 2020 10:13:18 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00KF8vOG105162;
        Mon, 20 Jan 2020 15:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=S3A4Yw2AqqKvhYGC11P+gLmOed30XjYVJ5VIWdMZd8Q=;
 b=YSYa0t0OHnnBj5twvuhKoL0WDfRn6MnkQMndF2saeyrRnUdgrGEHBdvRT7dSnYa7cx7o
 RGeQQA9Vyq0SFnZUfMsp8MIQlsPdVySD9BXnx/17smowwcyfEm5B/iFJnTo8QbMPhYW+
 ym7yBRpzncFjIWEaVAzUY0rmgR4iLyPfNyabIu9ZkHjkv/1D9Wei2PRscKj+pAOgbWjT
 qyX0q978/B6Or5pAcFiqAFRTRys0wQBr2mzFLV1Qr5ZMbkjI9io3iRWHjjXMUULaclF0
 Dk3CBcpo/VF18WfhVBc6snekOLbqieCsL1NI7BvFFo4fGP4IOkqXBhpfopeTHK3HR+wP QA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2xktnqyw8m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Jan 2020 15:13:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00KF8sSj006597;
        Mon, 20 Jan 2020 15:13:14 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 2xmbg8jxew-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Jan 2020 15:13:14 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00KFDDJH012153;
        Mon, 20 Jan 2020 15:13:13 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 20 Jan 2020 07:13:12 -0800
Date:   Mon, 20 Jan 2020 18:17:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ido Schimmel <idosch@mellanox.com>
Cc:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] netdevsim: fib: Add dummy implementation for FIB
 offload
Message-ID: <20200120151716.GL19765@kadam>
References: <20200120143712.wzgjjpwuvrtbioef@kili.mountain>
 <20200120144342.GA3582580@splinter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120144342.GA3582580@splinter>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9506 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=796
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001200128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9506 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=844 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001200128
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jan 20, 2020 at 02:43:45PM +0000, Ido Schimmel wrote:
> On Mon, Jan 20, 2020 at 05:37:12PM +0300, Dan Carpenter wrote:
> > Hello Ido Schimmel,
> > 
> > The patch 48bb9eb47b27: "netdevsim: fib: Add dummy implementation for
> > FIB offload" from Jan 14, 2020, leads to the following static checker
> > warning:
> > 
> > 	drivers/net/netdevsim/fib.c:663 nsim_fib6_rt_insert()
> > 	error: 'fib6_rt' dereferencing possible ERR_PTR()
> > 
> > drivers/net/netdevsim/fib.c
> >    460  nsim_fib6_rt_create(struct nsim_fib_data *data,
> >    461                      struct fib6_entry_notifier_info *fen6_info)
> >    462  {
> >    463          struct fib6_info *iter, *rt = fen6_info->rt;
> >    464          struct nsim_fib6_rt *fib6_rt;
> >    465          int i = 0;
> >    466          int err;
> >    467  
> >    468          fib6_rt = kzalloc(sizeof(*fib6_rt), GFP_ATOMIC);
> >    469          if (!fib6_rt)
> >    470                  return NULL;
> >                         ^^^^^^^^^^^
> 
> Dan, thank you very much for the report. It is already fixed in net-next
> thanks to Eric Dumazet:
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=41cdc741048b0d04604c02aad9ec19f7d9130b70
> 
> Can you share the static checker you used so I can avoid these mistakes
> in the future? Alternatively, is it possible to register development
> trees for this service like with the kbuild robot?
> 
> Thanks in advance.

It's a Smatch warning but you need to rebuild the kernel data.

~/path/to/smatch/smatch_scripts/build_kernel_data.sh

It takes a few hours (maybe four) to rebuild.

regards,
dan carpenter

