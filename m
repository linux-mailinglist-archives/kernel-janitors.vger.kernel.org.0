Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94BB3AEBA1
	for <lists+kernel-janitors@lfdr.de>; Tue, 10 Sep 2019 15:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730709AbfIJNcz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 10 Sep 2019 09:32:55 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:57772 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728244AbfIJNcz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Sep 2019 09:32:55 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8ADTahJ077135;
        Tue, 10 Sep 2019 13:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=Ob/VhK2HZWtLu7Kc+t1OnTj43TDNLObrKLKE6lWFC0o=;
 b=eNJQkbiR+h2qsgzorhu6sevTSQ8FBC+028FYSbpDskj2WDflT0Y73n6I83qJYiZ7Z/Df
 eFkq6wKBTDazg6a+8VvJT9gVN1YAZMuxDTGKXN3Dn3+tMMuIaW3itFuoQDbkTcyMDgbj
 gOIvMR2nQIMHGA3eS/JQi7cwKhOKSRxEx+ReUHDgSNQeo46qv7Qn3DVISQJfa34DKh+K
 I5eBRWHpKgi8kZh4x+kippVY3tlkgLq75LS8O0stkDeDxY73L5Iz4mtkdgv9MHe2pgSK
 3yKEWr7pFbwREapJ2HoMidXSpV4r8Uwx9cP4GAwa92ASSoK1QarkErPjr9zfVq5ZOGrw qg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 2uw1jy3e6p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Sep 2019 13:32:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8ADTl01139937;
        Tue, 10 Sep 2019 13:32:40 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 2uwpjvtryk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Sep 2019 13:32:39 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8ADWXN0016751;
        Tue, 10 Sep 2019 13:32:33 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 10 Sep 2019 06:32:33 -0700
Date:   Tue, 10 Sep 2019 16:32:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] drm: panel-lvds: Potential Oops in probe error
 handling
Message-ID: <20190910133226.GD20699@kadam>
References: <20190904115057.GC4811@pendragon.ideasonboard.com>
 <20190904185507.GA3634@mwanda>
 <20190908160428.GA20115@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190908160428.GA20115@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9375 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909100132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9375 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909100132
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Sep 08, 2019 at 06:04:28PM +0200, Sam Ravnborg wrote:
> Hi Dan.
> 
> On Wed, Sep 04, 2019 at 09:55:07PM +0300, Dan Carpenter wrote:
> > The "lvds->backlight" pointer could be NULL in situations were
> > of_parse_phandle() returns NULL.  Also it's slightly cleaner to use
> > backlight_put() which already has a check for NULL built in.
> > 
> > Fixes: 7c9dff5bd643 ("drm: panels: Add LVDS panel driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> A much better fix would be to introduce use of devm_of_find_backlight().
> Then you do not have to worry about put().
> 
> Care to respin a v3 that does this?

Sure.  That does look nice.  I will resend tomorrow.

regards,
dan carpenter

