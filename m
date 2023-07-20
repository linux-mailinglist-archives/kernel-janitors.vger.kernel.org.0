Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D874575B81C
	for <lists+kernel-janitors@lfdr.de>; Thu, 20 Jul 2023 21:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbjGTTiK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 20 Jul 2023 15:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjGTTiI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Jul 2023 15:38:08 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED1B1733
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jul 2023 12:38:07 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-794d1714617so491811241.0
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jul 2023 12:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1689881887; x=1690486687;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1Aqo/gOfqS4N7dGQz+LUmrfdtT5oEda+VCbRxOBGots=;
        b=ZPaTGFbmPqDHsbzbKNAF//LB+sGL+e8ErB9u8GPN/U8qhUhBpWU5DIlQwFlaDosZe/
         p1YWZfL3b3cBv1nolfN1PNi4DeR4PLwvVzZ8fAj+6nw3DJAb24Wqwn/VwUKntTp3zLV/
         9PHE6PTDFxEEuWsRiOmcnrinF/tMUX8t8I6vFEk32+8BM+uucBbqMGvACmUVHREvXSQ2
         HvmI9/5EXLfhUHjBHEsGfUVIE9qZApojxEI/84CjLmIDw6RrJ11Nk64mtLaXw3/LKsKD
         hTMcKlTEGHrqIcfyBbirCeTGt5dsWczFkP9j9uFUhQYSDLaN147PSimQJiTkAVD0FgM0
         +qrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689881887; x=1690486687;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Aqo/gOfqS4N7dGQz+LUmrfdtT5oEda+VCbRxOBGots=;
        b=bpCVjTo3q5z0wWm+a2vLr9X/5HN2ZGT2dBnbpXiB9e0aRoCqf/Lxz21/kYjgSzCRCz
         THxFVhkQ/tmet0fOpgBJCFztnPqaIEPQFpWPERrb/t67Pbf3N4Y6BgBWoTce+PWRIire
         +myS9+S/dj8orzi5XlmnmLmg5yaVxOMlwiVtw4ZyyajsQmQ8zgyPHDbu+b4EzIISaF9P
         j8wJ7W/p61qjhoM2++lYL6EP6sx69G/ABrccKZp4KsiY0r/8NxIPbpsfupr5YEYJ7MpA
         dgIj5tUCiL3HCzDH3UksDk+66Kod+jiCDzlZHqlBf23dkt4wKLrocwbBGbHrRsjagZ/y
         2wzg==
X-Gm-Message-State: ABy/qLb7bMFbScAt7kDpL1pzDodcLYqgCPhIL5rN+CyN0R10WLzN6+tT
        Pd7S90otW6D9vipar0DVaQlKwg==
X-Google-Smtp-Source: APBJJlG58gxa9sCnD8UgtVvUAplhdSAm5YXTJem1cUMpfF3izF2KWjtxgd9RRD0H+1CykZ3PfvN1XA==
X-Received: by 2002:a67:f243:0:b0:445:3bf:9387 with SMTP id y3-20020a67f243000000b0044503bf9387mr12927466vsm.4.1689881886847;
        Thu, 20 Jul 2023 12:38:06 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:83d4::7a9])
        by smtp.gmail.com with ESMTPSA id r22-20020a0cb296000000b0063600a119fcsm687199qve.37.2023.07.20.12.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 12:38:06 -0700 (PDT)
Message-ID: <05048ff687ca5a030bbb218570f13e2165f623d8.camel@ndufresne.ca>
Subject: Re: [PATCH 3/4] media: mediatek: vcodec: Fix potential crash in
 mtk_vcodec_dbgfs_remove()
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
Date:   Thu, 20 Jul 2023 15:38:05 -0400
In-Reply-To: <d4fffbaa-f01d-4e2e-9b1b-45d996236642@moroto.mountain>
References: <d4fffbaa-f01d-4e2e-9b1b-45d996236642@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le mercredi 14 juin 2023 =C3=A0 16:07 +0300, Dan Carpenter a =C3=A9crit=C2=
=A0:
> The list iterator "dbgfs_inst" is always non-NULL.  This means that the
> test for NULL inside the loop is unnecessary and it also means that the
> test for NULL outside the loop will not work.  If we do not find the item
> on the list with the correct the ctx_id then it will free invalid memory
> leading to a crash.
>=20
> Fixes: cd403a6a0419 ("media: mediatek: vcodec: Add a debugfs file to get =
different useful information")

Clearly better.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  .../media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c b/=
drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
> index 2151c3967684..2ebf68d33d57 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
> @@ -166,16 +166,13 @@ void mtk_vcodec_dbgfs_remove(struct mtk_vcodec_dev =
*vcodec_dev, int ctx_id)
>  	struct mtk_vcodec_dbgfs_inst *dbgfs_inst;
> =20
>  	list_for_each_entry(dbgfs_inst, &vcodec_dev->dbgfs.dbgfs_head, node) {
> -		if (dbgfs_inst && dbgfs_inst->inst_id =3D=3D ctx_id) {
> +		if (dbgfs_inst->inst_id =3D=3D ctx_id) {
>  			vcodec_dev->dbgfs.inst_count--;
> -			break;
> +			list_del(&dbgfs_inst->node);
> +			kfree(dbgfs_inst);
> +			return;
>  		}
>  	}
> -
> -	if (dbgfs_inst) {
> -		list_del(&dbgfs_inst->node);
> -		kfree(dbgfs_inst);
> -	}
>  }
>  EXPORT_SYMBOL_GPL(mtk_vcodec_dbgfs_remove);
> =20

