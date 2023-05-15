Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3AAC703037
	for <lists+kernel-janitors@lfdr.de>; Mon, 15 May 2023 16:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241784AbjEOOm2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 15 May 2023 10:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241730AbjEOOmX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 May 2023 10:42:23 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A094E1FCE
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 07:42:21 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f42c865535so71510145e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 07:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684161740; x=1686753740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mbrnFaoPoV6auTnbAVlCpOChJelNMoaQ+2iKpw9ZQo8=;
        b=WDeApaIrAr+nh2FVyb9Z6WeHppbkgOb2aoo76JB8r2GU2gpn+xDvf7iEja0Uj0t0sq
         zz0SGP3rV8EL7vCCnmHRoibOo1wwNfGhKLNX6fXr7gM+0pHjPzO006kxoI+hIkXfmz5c
         NznoxgDGdmZD13gTlnhlFeDdUhiCFnqKSxYiKicqCHNTCElJKDOAZe/CEr5kiOuHifN1
         lza/YD10Z1BKY+HNIwjR6juaMTHLKcbCnJfk3+ZWTnOv0TORHgQ5tG9z2Ut+ruizi+3+
         QXLO1JoIOQenBxAoHqQprCf0TyWBUfSby8bdxjv03ewsdWp1wFbq2QMJEv9nEuPxDcPy
         Uweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684161740; x=1686753740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mbrnFaoPoV6auTnbAVlCpOChJelNMoaQ+2iKpw9ZQo8=;
        b=Zg8xb/JGh17j4vEwMDRf2a99XlKXfPJOWnU6fzybF8I1gTcEr7NfDGZqHXzm9rHTMV
         F0vy2Jrdk714KWCf1FFEX2HgsYmc5I2g0UL0tYXdMxlUhA45DmYfW4+bnwSxrmtJ/j1H
         ZtILXHVijZWVsSqRwxMLGdIwUVstn9kMrranVNH1cv2oF5LiuCVXYqbX4EQOdNfTnybM
         6X3mEmYKBtH8I1oM/7dIUfdL7zFEALTGbS9BkDVjzOVy7Zf3c/Wlq+CshNCN8xAJRjwn
         PwCu4UntsxQe+KTMnJia1dRrRvZ8GNjG8viiMdFqt50Vn3WNmEaWOpwCOJgmMGEK9AaS
         EYoQ==
X-Gm-Message-State: AC+VfDz75akRb7/AJromLOBzDQ1Fg5ja1GkwuTQB5NKsjBhDtq5LqqTS
        fzniRRq1iQ/19E9OhW8ygtgveQ==
X-Google-Smtp-Source: ACHHUZ4ZdYo0QmdipmTJhbkhtqheg8LHZCjI5dchfxlFIwk6dZAR0+yhLfsv/+iAKWWM7rlClTMNrQ==
X-Received: by 2002:a05:6000:1191:b0:306:462a:b78d with SMTP id g17-20020a056000119100b00306462ab78dmr21924023wrx.53.1684161740075;
        Mon, 15 May 2023 07:42:20 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i6-20020adfdec6000000b002c70ce264bfsm32690343wrn.76.2023.05.15.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 07:42:18 -0700 (PDT)
Date:   Mon, 15 May 2023 17:42:14 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Su Hui <suhui@nfschina.com>, Xinhui.Pan@amd.com,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        christian.koenig@amd.com
Subject: Re: [PATCH] drm/amdgpu: remove unnecessary (void*) conversions
Message-ID: <be331480-4ea1-4798-81ec-540cb662c8b7@kili.mountain>
References: <20230515013428.38798-1-suhui@nfschina.com>
 <ebe9d98c-148d-4694-8f97-96bacd0b9f7d@kili.mountain>
 <CADnq5_Nei-XHsD8DQkpUGZwZAik5X-S1R3znOJGD1X2jAxD6_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_Nei-XHsD8DQkpUGZwZAik5X-S1R3znOJGD1X2jAxD6_g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 15, 2023 at 10:11:39AM -0400, Alex Deucher wrote:
> On Mon, May 15, 2023 at 3:17 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Mon, May 15, 2023 at 09:34:28AM +0800, Su Hui wrote:
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > index f60753f97ac5..c837e0bf2cfc 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > @@ -1470,7 +1470,7 @@ int amdgpu_debugfs_regs_init(struct amdgpu_device *adev)
> > >
> > >  static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
> > >  {
> > > -     struct amdgpu_device *adev = (struct amdgpu_device *)m->private;
> > > +     struct amdgpu_device *adev = m->private;
> > >       struct drm_device *dev = adev_to_drm(adev);
> > >       int r = 0, i;
> > >
> >
> > This declaration block was originally written in reverse Christmas tree
> > order:
> >
> >         long long long variable name;
> >         medium length name;
> >         short name;
> >
> > So you probably want to change the order now that the lengths have
> > changed.  Same in the other places as well.
> 
> I don't think it's possible due to the variable dependencies unless
> you separate the declarations and assignments which doesn't seem like
> a net win to me.

Gar.  I'm dumb.  Sorry for the noise.

regards,
dan carpenter

