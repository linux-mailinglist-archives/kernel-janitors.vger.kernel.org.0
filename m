Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDC96385D9
	for <lists+kernel-janitors@lfdr.de>; Fri,  7 Jun 2019 09:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbfFGH6x (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 7 Jun 2019 03:58:53 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:33510 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbfFGH6x (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jun 2019 03:58:53 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x577nVRC095671;
        Fri, 7 Jun 2019 07:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=ter9yOdrvJ8FGiHpDwCBQ57Fld0PwEchc7IkXdlXTwk=;
 b=ixxeG9+W6IgAkBP8qnTZQf/CRIEnUrIRWaoU6INj6M3JCXfL4OWdRCr3f1Ln+IdSRruD
 0vGQx4RaIC+IDvQWd/sDRywBiGFPZXEJIC4PVy2bJO38Y/vYuUOSEx9PkUyYy9K9hxVQ
 x0oeFscl89zKsu6eLi7HstSIAPskJhkjaRigf29DJFGgPckOcHw198rtVXntEjQR9Cr6
 Qc+nRATUiybpTJxT++/6oVWMHttqWjwm0XdMe13ANyFtt+wMs10JDJW0h8+OP4uLTPs0
 eoNSdlAyteKpYQ1dBvACbZF+jmiNy+SUYnYo1X97bkpOnt9kU9f3+L9iS9KTOU9e6Eai QQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2suj0qvnja-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 Jun 2019 07:58:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x577w0vr038554;
        Fri, 7 Jun 2019 07:58:33 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 2swnhd4a9e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 Jun 2019 07:58:33 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x577wVRs029804;
        Fri, 7 Jun 2019 07:58:31 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 07 Jun 2019 00:58:30 -0700
Date:   Fri, 7 Jun 2019 10:58:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     walter harms <wharms@bfs.de>
Cc:     Andrzej Hajda <a.hajda@samsung.com>, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: re-order conditions to prevent
 out of bounds read
Message-ID: <20190607075823.GO31203@kadam>
References: <20190607072704.GA25229@mwanda>
 <5CFA14CD.5010502@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5CFA14CD.5010502@bfs.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906070057
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906070056
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 07, 2019 at 09:39:57AM +0200, walter harms wrote:
> 
> 
> Am 07.06.2019 09:27, schrieb Dan Carpenter:
> > This should check that "i" is within bounds before checking reading from
> > the array.
> > 
> > Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/bridge/sii902x.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> > index d6f98d388ac2..6b03616d6bc3 100644
> > --- a/drivers/gpu/drm/bridge/sii902x.c
> > +++ b/drivers/gpu/drm/bridge/sii902x.c
> > @@ -589,8 +589,8 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
> >  	if (ret)
> >  		goto out;
> >  
> > -	for (i = 0; sii902x->audio.i2s_fifo_sequence[i] &&
> > -		     i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence); i++)
> > +	for (i = 0; i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence) &&
> > +		    sii902x->audio.i2s_fifo_sequence[i]; i++)
> >  		regmap_write(sii902x->regmap,
> >  			     SII902X_TPI_I2S_ENABLE_MAPPING_REG,
> >  			     sii902x->audio.i2s_fifo_sequence[i]);
> 
> 
> mmmh, i am a big fan of KISS and in this case i would check sii902x->audio.i2s_fifo_sequence[i]
> outside for(). like:
> 
> 	 for (i = 0; i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence); i++) {
> 	        if (!sii902x->audio.i2s_fifo_sequence[i])
>                          break;

That's probably a better way, but either way is acceptable and I left it
how the author wrote it.

regards,
dan carpenter

