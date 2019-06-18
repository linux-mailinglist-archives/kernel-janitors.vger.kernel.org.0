Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A64E4A145
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 Jun 2019 14:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbfFRM66 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 Jun 2019 08:58:58 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:39842 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbfFRM66 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jun 2019 08:58:58 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5ICwfa1126644;
        Tue, 18 Jun 2019 12:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=TQk1dSNmuyQhx/dVU9Ha+bmmx+zy4oC9lrmr0y3O+tY=;
 b=st1QU4gauwmAPp6/Tv/ITRMYwYr4f243hNds1I8PVnURxxc4C5NiOshMMI6y0Cr5zJ0G
 AT+fQFq4qe72Qbgqs5dwBBZV/LV/pXZncdxGOc7cMfp/bVafQPZAFMk4Qi+nDS5cy4gF
 wBUO5BOItDbqQfaXgMH4pvJkwrqxmCMgRJwOyenlo6bXhA1WgRwC1MroHX6BMLTsfK3B
 InO9n1BivWNmfU+Rrd44NuBgOWl/JKL1EWgmBTBN1xMIG1o8J6jp73wRcXIm/kiYfnh2
 CbEB/Ffsz5f8/YUxSH11HuGXL9MavoOEFyMgRnCWGfrXCgqy/i2imUlCRuAB2wGSwzum BQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 2t4rmp4aaf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Jun 2019 12:58:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5ICw3jf034004;
        Tue, 18 Jun 2019 12:58:47 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2t5cpe1f7d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Jun 2019 12:58:46 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5ICwhMU024608;
        Tue, 18 Jun 2019 12:58:44 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 18 Jun 2019 05:58:43 -0700
Date:   Tue, 18 Jun 2019 15:58:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm: return -EFAULT if copy_one_buf() fails
Message-ID: <20190618125833.GG18776@kadam>
References: <20190618125623.GA24896@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618125623.GA24896@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=938
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906180107
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=995 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906180107
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Ah crap.  I need to fix copy_one_buf32() as well.  I will sent a v2.

regards,
dan carpenter

