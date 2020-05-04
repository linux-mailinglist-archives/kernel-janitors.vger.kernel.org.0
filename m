Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7BF1C46FA
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 May 2020 21:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgEDTXy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 4 May 2020 15:23:54 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:49376 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgEDTXx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 May 2020 15:23:53 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 044JJDwb104211;
        Mon, 4 May 2020 19:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=mime-version :
 message-id : date : from : to : cc : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=H7gAs1dZ+cLvdEX0erNBpeBbh3M2FxyC2l4SSeJZwpg=;
 b=vOQUfrYO+dwWcmmHy18BCtXp33h2BhF+Jxbs0b+EeJh9DBkV2Nj24Ny3f1Ed7OKht+lq
 yIU0FRQ5Ay1GVuCkjBwUugmSAv9PnEiPWTVkNe1QkbBVSn+kmVv1+40FAVD/Y89uvwxx
 ge6xsm63zr6UCWIXeY/VvwDcdXJyvMt/qyqal+mvB9r9PSZRoOwChpGlgDF9Hrh/bn+5
 5nIkSqd0KuAt3UnGtekA9xT4k/1vPOsWXVpQVEPog1HhUslng+n8x9X52SSZJ2pDzJa4
 SeqyJiXx3NjQKGctlsBxojSSf5rzq/pAkBrkDap+o2qlB7U4urPR90tyiKEwVHTtqWgr sg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 30s0tm8vrj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 May 2020 19:23:49 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 044JGhCb121632;
        Mon, 4 May 2020 19:23:49 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 30sjdr6up1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 May 2020 19:23:49 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 044JNmo0023370;
        Mon, 4 May 2020 19:23:48 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 May 2020 12:23:45 -0700
USER-AGENT: Mutt/1.9.4 (2018-02-28)
MIME-Version: 1.0
Message-ID: <20200504192339.GW2014@kadam>
Date:   Mon, 4 May 2020 19:23:39 +0000 (UTC)
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: question about lists
References: <alpine.DEB.2.21.2005032308500.2533@hadrien>
In-Reply-To: <alpine.DEB.2.21.2005032308500.2533@hadrien>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9610 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 mlxlogscore=956 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005040151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9610 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005040151
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, May 03, 2020 at 11:10:01PM +0200, Julia Lawall wrote:
> Hello,
> 
> I was wondering what is the point of code like the following:
> 
>         INIT_LIST_HEAD(&bb->list);
>         list_add(&bb->list, &s->workload->shadow_bb);
> 
> As far as I can see, list_add will initialize both fields of the list_head
> structure without looking at their values, so why is the INIT_LIST_HEAD
> needed?

Yeah.  You're right.  It's not needed.

regards,
dan carpenter

