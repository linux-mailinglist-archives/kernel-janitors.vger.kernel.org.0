Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2879722EC5A
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Jul 2020 14:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728432AbgG0Mke (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Jul 2020 08:40:34 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:54670 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728286AbgG0Mkd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Jul 2020 08:40:33 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RCc6of028920;
        Mon, 27 Jul 2020 12:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=M68ukQ8Os/kHctcQAPi2LkEsnrbbw42fL276mIZQPNU=;
 b=h+2qPLMEPnc8oNZZ/8EkMYBA6bVNMapi8N3vxsaQeH5KMZ49w6R1QkwaE3l7vkPw1E6+
 VZ4J+iy0PBFkXPMrPPjQVuKsifv+5V40TwJHoMUa5R75cER+6c8dYqF49QFgDBIFUrZL
 qV/N68xN/ESxJmoFfxEAnFvcTOSiaC3YxzJOoTr0sY7mhp8+1j6CLhlZbbeIadg9+Lcp
 m2XhEpiEt6Fm1s8mg9BRZsRjdfnahxxrkii1Hx3XY2gehsGCoxCkkUiEkAvA+SBmcUAh
 FMjJSdYyuPG/ZC7v+q/hYMMJWQNAOZYOPV7LQqkzzpcFDlFR1eP+5OjaotWWngn+qT+l TA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 32hu1j18e7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jul 2020 12:40:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RCccK8060739;
        Mon, 27 Jul 2020 12:40:31 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 32hu5shyd5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jul 2020 12:40:31 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06RCeTXE009168;
        Mon, 27 Jul 2020 12:40:30 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 27 Jul 2020 05:40:29 -0700
Date:   Mon, 27 Jul 2020 15:40:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alexander Lobakin <alobakin@marvell.com>
Cc:     Igor Russkikh <irusskikh@marvell.com>,
        Michal Kalderon <michal.kalderon@marvell.com>,
        Ariel Elior <aelior@marvell.com>,
        kernel-janitors@vger.kernel.org
Subject: Re: [bug report] qed: sanitize PBL chains allocation
Message-ID: <20200727124022.GZ2571@kadam>
References: <20200727112117.406-1-alobakin@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727112117.406-1-alobakin@marvell.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxscore=0 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1011 mlxscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270093
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 27, 2020 at 02:21:17PM +0300, Alexander Lobakin wrote:
> Data: Mon, 27 Jul 2020 13:32:00 +0300
> From: Dan Carpenter <dan.carpenter@oracle.com>
> 
> > Hello Alexander Lobakin,
> 
> Hi Dan!
> 
> > The patch 9b6ee3cf95d3: "qed: sanitize PBL chains allocation" from Jul 23, 2020, leads to the following 
> > static checker warning:
> > 
> > 	drivers/net/ethernet/qlogic/qed/qed_chain.c:299 qed_chain_alloc_pbl()
> > 	error: uninitialized symbol 'pbl_virt'.
> 
> Oh Gosh, how could I miss that with W=1 C=1.

It's a bug in GCC.  It initializes it to zero instead of complaining.
It seems to have gotten worse in recent months...

regards,
dan carpenter

