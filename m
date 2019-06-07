Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40C993852A
	for <lists+kernel-janitors@lfdr.de>; Fri,  7 Jun 2019 09:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727732AbfFGHkG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 7 Jun 2019 03:40:06 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:16502 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725497AbfFGHkF (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jun 2019 03:40:05 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 15F8720366;
        Fri,  7 Jun 2019 09:39:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1559893199; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ReZ0V4gRyn84xeXuviMTr2p2aMWQv3RUucZaYJp3CBQ=;
        b=WxFpNEbOz8cyeEpzZ2OLeY9ZTjSBaPDNJ2IAuVOeDCdVHlLLBahRnj+OAOVy2CsyHXypHz
        si/+fcgJaBRo4xtN30B70VP0y2BAib5Npqj+ttf7vnR0TelGBoVIALXW/gryKY687WzBvj
        lP03NEB3yVF5dgxF0/JpI4A9WwiPOCaZRSeyXrXiB7KjvR59hI/+Jkvw/h7Cx/K+NMuDvB
        OsnVdmOe7VjSr4m7fhbv2vUMkeKdmLLyVxPnlFmfbBn7eJyPCFn8fHr9aTfaiY85f09MPf
        guJRl2KkzhK/kwm9Ih+KpaS+XkTMaf+CXNtNCUpnwzisteLes0GrBDlJkBo9vA==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id 8F0AFBEEBD;
        Fri,  7 Jun 2019 09:39:57 +0200 (CEST)
Message-ID: <5CFA14CD.5010502@bfs.de>
Date:   Fri, 07 Jun 2019 09:39:57 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Andrzej Hajda <a.hajda@samsung.com>, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: re-order conditions to prevent
 out of bounds read
References: <20190607072704.GA25229@mwanda>
In-Reply-To: <20190607072704.GA25229@mwanda>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.00
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.00 / 7.00];
         ARC_NA(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         BAYES_HAM(-2.90)[99.56%];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_SEVEN(0.00)[8];
         NEURAL_HAM(-0.00)[-0.999,0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_TLS_ALL(0.00)[]
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



Am 07.06.2019 09:27, schrieb Dan Carpenter:
> This should check that "i" is within bounds before checking reading from
> the array.
> 
> Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index d6f98d388ac2..6b03616d6bc3 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -589,8 +589,8 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
>  	if (ret)
>  		goto out;
>  
> -	for (i = 0; sii902x->audio.i2s_fifo_sequence[i] &&
> -		     i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence); i++)
> +	for (i = 0; i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence) &&
> +		    sii902x->audio.i2s_fifo_sequence[i]; i++)
>  		regmap_write(sii902x->regmap,
>  			     SII902X_TPI_I2S_ENABLE_MAPPING_REG,
>  			     sii902x->audio.i2s_fifo_sequence[i]);


mmmh, i am a big fan of KISS and in this case i would check sii902x->audio.i2s_fifo_sequence[i]
outside for(). like:

	 for (i = 0; i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence); i++) {
	        if (!sii902x->audio.i2s_fifo_sequence[i])
                         break;

                 regmap_write(sii902x->regmap,
  			     SII902X_TPI_I2S_ENABLE_MAPPING_REG,
  			     sii902x->audio.i2s_fifo_sequence[i]);
	}

just my 2 cents,

re,
 wh
