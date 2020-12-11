Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C76A32D776B
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Dec 2020 15:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405060AbgLKOGf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Dec 2020 09:06:35 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:39244 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393459AbgLKOGN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Dec 2020 09:06:13 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBDs8X4005083;
        Fri, 11 Dec 2020 14:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=M6pFORZ33vQuSMmmHvuKYfGD6U+3RAeesD2mMi7SKF0=;
 b=TerDr4e6DP7CPuqGfGeI7jdlmDocLqQgN5Q/IJeNdnp/CMJj1BTZdJXlFa/cCkCbVCzO
 zV2Xo30/bNl9tVS81cgk/QGP2WZR2nIvEiBP/07LnC7CEPA/fiVOxuTgpi8dNbufaXhG
 QjR4ZlUMJ2cAF9Z39FQj29Wd7h7hAQdIcxgSFIEl3cmtxvQrBGIiEyts7j46jfwXM8Mb
 REJHZmPTEh56XQY4X8QOmIu6kVV0P5wb8V5jOTtq6eirz892Q7GAorD5ZtqTa73upgQH
 4YUvOVRflvEMxT8EK+xmzLL0S84IvPlvGY77f1FhDBG+oDx76nhLQxL0/8p709Fa96Ue XQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 35825mjrjs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Dec 2020 14:05:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBDtsAH072495;
        Fri, 11 Dec 2020 14:05:16 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 358m53yedy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Dec 2020 14:05:16 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BBE59k5024821;
        Fri, 11 Dec 2020 14:05:09 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 11 Dec 2020 06:05:09 -0800
Date:   Fri, 11 Dec 2020 17:04:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/panel: khadas: Fix error code in
 khadas_ts050_panel_add()
Message-ID: <20201211140459.GR2767@kadam>
References: <X9NEfmgGilaXJs2R@mwanda>
 <20201211110157.GA527186@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211110157.GA527186@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=852
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=882 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110090
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Dec 11, 2020 at 12:01:57PM +0100, Sam Ravnborg wrote:
> Hi Dan,
> 
> I assume your nice tooling found this buggy.

Yeah.  Passing a valid pointer to PTR_ERR().

regards,
dan carpenter

