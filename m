Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF08275B828
	for <lists+kernel-janitors@lfdr.de>; Thu, 20 Jul 2023 21:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbjGTTjj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 20 Jul 2023 15:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjGTTji (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Jul 2023 15:39:38 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B364819BE
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jul 2023 12:39:37 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4039f0d140eso10253121cf.1
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jul 2023 12:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1689881977; x=1690486777;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VsRhJr7FcY6scIMyHxPkpixR+U75ZGXGrefwCjTURTo=;
        b=XzvE7+OHdICE7PEV0/J3stP745/NNNfkJnUDAAy0Bquc/kjJYwmwJAbPz4M9B9qwTL
         MT1eF92Rce35E9PkT19HKVrlbg48F3M/vHUoWw5brFvShrlrbkvnHvH4HJBwlrNRrI3t
         O4BA9JdPwbtKcdsjlHZJY36rxdaZ0+QrFaJ5rSpZu+2OB08ab44HvfmP6BRm/lLKl2zC
         qLiWlu/VhAcaiJTOM0XbyAVlsVqP6U7AbPskt0fNttLVn0fdmnvUxReptFn/7SGRHWZK
         HFq0YuMULs5QTQGbrEO1ynb9t6YCaM3ZugDtBV2x9ejzFSten3BL9lo9Y15kq8ukvaK4
         Krog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689881977; x=1690486777;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VsRhJr7FcY6scIMyHxPkpixR+U75ZGXGrefwCjTURTo=;
        b=i78UPca/+i9sMgtdAkklnq3ERuqXTV8LV/+F2jju+KKazGkayXLeLC/BAHXluEENfh
         zKrQedrDYuSxJ0mxJ9VVnrBR6anq/JLZXbs6aHHNa9rYD9rAaZzefv8gy+eMQNS/6Bb8
         iKrkf0Nne/Y4+HFNNULegZZYcTO9OVD5d8g67FeVVU3sbpPkYwODfEOKsl67Lpjs8acw
         NBnoOLEUFg/tKU2f46sygPmtY5LdgD3sCktPn19yrvjG8cHquTDKyVBc3PG82Qp/sBVy
         k12bdmnShPhiQWJ61q+aVZ3gBIhUbDCAJvA5j8GQOjcGNPIQPCPZWwwlzDfofwciSnTu
         4dDA==
X-Gm-Message-State: ABy/qLZshCZRTqSNpmG2t1iaP1Z/VJtQh1k/UTFWHfCcHvb39Nv/houc
        EqOjtLvbM2Brh1lTfxkBEtIM8w==
X-Google-Smtp-Source: APBJJlHvIsE+gIX66810YXYx0n0V9nlbQz7+vMSGp5n9VGHmJ7qSPjqcY/YQozwfUhbiwtAg2VZ+eA==
X-Received: by 2002:a05:622a:284:b0:3ff:3013:d2aa with SMTP id z4-20020a05622a028400b003ff3013d2aamr80864qtw.12.1689881976834;
        Thu, 20 Jul 2023 12:39:36 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:83d4::7a9])
        by smtp.gmail.com with ESMTPSA id j7-20020ac84c87000000b00401e04c66fesm658223qtv.37.2023.07.20.12.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 12:39:36 -0700 (PDT)
Message-ID: <492454f84df67bf70c760142546232a730305330.camel@ndufresne.ca>
Subject: Re: [PATCH 4/4] media: mediatek: vcodec: Improve an error message
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Date:   Thu, 20 Jul 2023 15:39:35 -0400
In-Reply-To: <0cdeeee4-3bd7-4bd5-88a1-c5ecf7f6a1f8@moroto.mountain>
References: <0cdeeee4-3bd7-4bd5-88a1-c5ecf7f6a1f8@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

Le mercredi 14 juin 2023 =C3=A0 16:19 +0300, Dan Carpenter a =C3=A9crit=C2=
=A0:
> This is intended to print the error code but there is a typo so it
> prints IS_ERR() instead of PTR_ERR().
>=20
> Fixes: 77f3b023f452 ("media: mediatek: vcodec: Add debugfs interface to g=
et debug information")

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> This driver has quite a bit of code to handle the case where DEBUG_FS is
> turned off.  It's a bit over engineered.  With debugfs you're normally
> just supposed to call the functions and ignore the errors.
>=20
> But it's also harmless to do it this way.
>=20
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c b/=
drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
> index 2ebf68d33d57..6957105492ae 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
> @@ -185,8 +185,8 @@ void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vco=
dec_dev, bool is_encode)
>  	else
>  		vcodec_dev->dbgfs.vcodec_root =3D debugfs_create_dir("vcodec-dec", NUL=
L);
>  	if (IS_ERR(vcodec_dev->dbgfs.vcodec_root))
> -		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%d\n",
> -			IS_ERR(vcodec_dev->dbgfs.vcodec_root));
> +		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%ld\n",
> +			PTR_ERR(vcodec_dev->dbgfs.vcodec_root));
> =20
>  	vcodec_root =3D vcodec_dev->dbgfs.vcodec_root;
>  	debugfs_create_x32("mtk_v4l2_dbg_level", 0644, vcodec_root, &mtk_v4l2_d=
bg_level);

