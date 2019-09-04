Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13CB5A8403
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Sep 2019 15:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729848AbfIDM5b (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Sep 2019 08:57:31 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:38294 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729635AbfIDM5b (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Sep 2019 08:57:31 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84Crrb8074477;
        Wed, 4 Sep 2019 12:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=zzmD9+q0DyZUpt7+k5TVx+uVeOvzTaoUPW4sKDLHV+k=;
 b=J8yVz9eOM+if2/Lz0C6xpucF3Cm09wkN0V/erhilc5r17z/koZwFw6BsgqeGEMYdQJb0
 hKF7BMV32WY5imH+mpg/FRO1MqNqE/umBkWQpTGfpQcXhzqOdmFJGg751ZfCPDPFqRZ4
 +nsBgyDeL/5w2bMhVl0tp4HR77X+xMsG1gkJWwI+oH0OqdyFCO+pZLFU/fcWmnCLyXHC
 I6SucSiadKz/YicwqCYPvWpqu/KgmbeNce2UbIed/7m2Z3ZVJjj+I4yq/Y6+vk5/J+FY
 1vfHoT7TXYHKOESFpiudLPZeWVS+wvRjwFwN2qWPnFA8jmu2fOk4QKX7JcsuF9gwYKe7 Ag== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2utdp3r0un-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Sep 2019 12:57:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84CrgRN142441;
        Wed, 4 Sep 2019 12:57:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2us5pj31tw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Sep 2019 12:57:16 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x84CvEpM029671;
        Wed, 4 Sep 2019 12:57:14 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 04 Sep 2019 05:57:13 -0700
Date:   Wed, 4 Sep 2019 15:57:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm: panel-lvds: Potential Oops in probe error handling
Message-ID: <20190904125704.GC3093@kadam>
References: <20190904100329.GE7007@mwanda>
 <20190904115057.GC4811@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904115057.GC4811@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909040129
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909040129
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 04, 2019 at 02:50:57PM +0300, Laurent Pinchart wrote:
> >  error:
> > -	put_device(&lvds->backlight->dev);
> > +	if (lvds->backlight)
> > +		put_device(&lvds->backlight->dev);
> 
> How about simply
> 
> -	put_device(&lvds->backlight->dev);
> +	backlight_put(lvds->backlight);

Yeah.  That's cleaner.  I will resend.

regards,
dan carpenter

