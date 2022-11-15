Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE537629C91
	for <lists+kernel-janitors@lfdr.de>; Tue, 15 Nov 2022 15:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbiKOOtC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 15 Nov 2022 09:49:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236796AbiKOOsz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 09:48:55 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECABFC1
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 06:48:53 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id p27-20020a056830319b00b0066d7a348e20so4641402ots.8
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 06:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UFKvegKpCUAO6MgZ/qzUV5hf5B11JezYYr9cZvWjkGQ=;
        b=lKzjf5PXGe1Bn+JDJFa1vd+nY6OQBXZFoKJXJ+Dt2SNQ7jHIw9sikj2GLcQuwqUARp
         OgfE8JlG7I/T6As9/B6qcn6ULrr9G53J+EzyqY70Y+lhsNs4vBwf2ElG7HhNPTmXlB2j
         67wcR/h+f6Oi56Y4TgY5iy7hBQqe2hJlVlhtznXNt7UjBnDqG05o5mA95EVX6z871MfS
         xvH67f2miDXhEfMdz+o6DSPWDFZgoG/1VFXrMX6F+pSl8FvWBvF01uEL8yFtQxTTcDtU
         nr6NsbpuVs8NcUm+GSRf0rXGMpQfdkqZIOfSWcwQJkCrxTvhRPEchN11fqg+AuqTZexh
         YmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UFKvegKpCUAO6MgZ/qzUV5hf5B11JezYYr9cZvWjkGQ=;
        b=V1wAHZMaGdBhenMSTYSTlQPexdIo1WpQG420fgK7/deCrpbJFirGDbtWvL8Y/QKsiz
         lmDJiQ4raCld3sb50yNXjgq+nL4qjk084qUhRnZUMXnJ4Hd+rWJheM7pvWexiCs/6W7w
         /jOTfyITQgCsAT0T33Y1KO/Sr0fdjluRbDlxFTVJgUh3njStOwogjYHhWaHGuaDAJqYg
         t2TkDztbAtE1NAQQokgiFI66YPUrAAbfIZYQHJUFXuXLdC8udYVCSTIkaJlbo8sjazwd
         WHF/onMalMtcmn7UcplhgCpRUXZDzMZI7F36R2qhJxHQNcxrqiUUxOTBtwFaOPO62jWc
         IjtQ==
X-Gm-Message-State: ANoB5pl+PLUydSnb3Ear4N0EXFO4IOYyBntedQnS2fmlPN28r9VyDVO3
        tnZR+rfRfDATuQVP7HzT+yWc5ii5mqIPMJAZet4=
X-Google-Smtp-Source: AA0mqf6fH/OmE1T3AB8Xx8ZsS8OzjaOPOa5/oK9LHJqmJMOjs3vfJYbmREd7PWHSZrBtVST7xciWzhewYsjrOIooCFs=
X-Received: by 2002:a9d:32f:0:b0:66c:7982:2d45 with SMTP id
 44-20020a9d032f000000b0066c79822d45mr8876027otv.123.1668523732619; Tue, 15
 Nov 2022 06:48:52 -0800 (PST)
MIME-Version: 1.0
References: <Y2ZH2FPSuX/msEL1@kili>
In-Reply-To: <Y2ZH2FPSuX/msEL1@kili>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 15 Nov 2022 09:48:41 -0500
Message-ID: <CADnq5_Pmv54SoFRgYWF90GTE9vJ3PScqN2z1a=AUm_omFLo_9Q@mail.gmail.com>
Subject: Re: [PATCH] amdgpu/pm: prevent array underflow in vega20_odn_edit_dpm_table()
To:     Dan Carpenter <error27@gmail.com>
Cc:     Evan Quan <evan.quan@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Darren Powell <darren.powell@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Lang Yu <lang.yu@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Tue, Nov 15, 2022 at 7:57 AM Dan Carpenter <error27@gmail.com> wrote:
>
> In the PP_OD_EDIT_VDDC_CURVE case the "input_index" variable is capped at
> 2 but not checked for negative values so it results in an out of bounds
> read.  This value comes from the user via sysfs.
>
> Fixes: d5bf26539494 ("drm/amd/powerplay: added vega20 overdrive support V3")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> index 97b3ad369046..b30684c84e20 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> @@ -2961,7 +2961,8 @@ static int vega20_odn_edit_dpm_table(struct pp_hwmgr *hwmgr,
>                         data->od8_settings.od8_settings_array;
>         OverDriveTable_t *od_table =
>                         &(data->smc_state_table.overdrive_table);
> -       int32_t input_index, input_clk, input_vol, i;
> +       int32_t input_clk, input_vol, i;
> +       uint32_t input_index;
>         int od8_id;
>         int ret;
>
> --
> 2.35.1
>
