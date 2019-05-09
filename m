Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 009AC18799
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 May 2019 11:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfEIJSk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 May 2019 05:18:40 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:44426 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbfEIJSk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 May 2019 05:18:40 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x499IVwN114742;
        Thu, 9 May 2019 09:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=xDoMAALAGcv2tNu9Qdwqi+s/r1uWWHiu8YrBqPo/57g=;
 b=tq6kUKA+6f1woX2D6EbehrqAsArP/nl7tO9wqhkfrGtpxM7wbTx++GUSPthpIUWnsvrj
 1Xm7lkD+bA2XKpk+nem1CGVNICmcW6W/fay6wwnzKVgO6LcgbSruZCuUo+YMjZ0Zs/iz
 w7ca643Jyqi9pWoAmm/OC3RrUEtSUCZd6aJbpeHKAioWPr6/w6+6pHtH6jVqSJmj8iBP
 FKHEVoEpowkWwUGNBHX8/IBghxSFNjT0+IGhLMgiZdCUkgM45OOdN1CyJoN/4dHVDoMf
 9nInTmiuzmhYZMITaX8a23CodyCtJLUbzbxQFahDQFLMjxwEeyjbujF2iydt6gB34RbW YQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2s94bg9gvq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 09 May 2019 09:18:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x499H71s108017;
        Thu, 9 May 2019 09:18:28 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2s9ayg33dm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 09 May 2019 09:18:27 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x499IPX1019932;
        Thu, 9 May 2019 09:18:26 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 09 May 2019 02:18:25 -0700
Date:   Thu, 9 May 2019 12:18:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [bug report] phy: renesas: phy-rcar-gen2: Add support for
 r8a77470
Message-ID: <20190509091815.GZ2239@kadam>
References: <20190503131010.GJ29695@mwanda>
 <OSBPR01MB2103C59136CB33ED587BC370B8310@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103C59136CB33ED587BC370B8310@OSBPR01MB2103.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9251 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905090057
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9251 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905090058
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

That check hasn't been released.  (It marks every "if (foo > bar) " as
off by one unless it can be proved as okay...

On Tue, May 07, 2019 at 06:54:10AM +0000, Biju Das wrote:
> biju@be1yocto:/data/biju/linux-next$ /data/biju/smatch/smatch_scripts/kchecker drivers/phy/renesas/
>   CHECK   scripts/mod/empty.c
>   CALL    scripts/checksyscalls.sh
>   CALL    scripts/atomic/check-atomics.sh
>   CHECK   drivers/phy/renesas/phy-rcar-gen2.c
> drivers/phy/renesas/phy-rcar-gen2.c:354 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
> drivers/phy/renesas/phy-rcar-gen2.c:360 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
> drivers/phy/renesas/phy-rcar-gen2.c:409 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
> drivers/phy/renesas/phy-rcar-gen2.c:420 rcar_gen2_phy_probe() warn: passing zero to 'PTR_ERR'
>   CHECK   drivers/phy/renesas/phy-rcar-gen3-usb2.c
> drivers/phy/renesas/phy-rcar-gen3-usb2.c:602 rcar_gen3_phy_usb2_probe() warn: passing zero to 'PTR_ERR'
> drivers/phy/renesas/phy-rcar-gen3-usb2.c:670 rcar_gen3_phy_usb2_probe() warn: passing zero to 'PTR_ERR'
> biju@be1yocto:/data/biju/linux-next$

Are you using the latest Smatch code?  I'm trying to figure out how to
reproduce these false and it feels like it should be really easy to do
a fresh clone and clean kernel tree but I can't make it work.

I got them for a while, but I fixed it and I thought I had pushed all
the fixes...

regards,
dan carpenter
