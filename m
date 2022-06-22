Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE2EC554E3E
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Jun 2022 17:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358619AbiFVPDi (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 22 Jun 2022 11:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358889AbiFVPDa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Jun 2022 11:03:30 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899F531DE6
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Jun 2022 08:03:27 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id g8so15634237plt.8
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Jun 2022 08:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=WAbWEL/oNK/UOovzR6YlHMKcA4dYcC7HgIpBKVf1Z6aLPQMKNkPnyRzXn5TSaGEloV
         TmQy2vr1kA/RAc7OoDtpJdUyYpSrJCLeb/BH0kegC5/LiVrA2gfzMNL8MrgkT7uFR5NE
         2sg1nSYNUGd9l1GQhQJbVP35/qf8AK++lJaYLJ8ao8KjU6cWvUkd/1yI0D3TJ1rBgo7m
         l3ipwPsxTgsmzX2464N8ISPYKa+8bIVvokuqcL59gXmFQ/gTLHnGfbYSW+RRs9uHt8As
         S504s37Wp7N0Dmac+HWTOQcaHD0jht+wf4g4pro9m1sMDyGhqkY9aD3omKDefUZbLwLo
         sSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=DFQ2zSkgJkNNJrByJSW8yNr0zbyQoqTGQAFsVrU9MFieDfknYYdxlPT7FCu5oPXDyG
         o4GMRas1bqO7V8OMbFwWXkFkElG7KJamPeVKLAev8g0JUGfBdCh9zUQuWx6z9lhO6/7r
         TMs6h3THhYeggi8Yg6FT0lZ96oxUEbjZNSBkmV8n1uDwX68FlMMbs4z6GIHmAEW9RcFR
         I/2vtSLL2NXkE7cJvvt/m5GbcfeBr24TyIIFkd+5mGqHyU4UC6oY1L945HMtSEXtcy2q
         lfDYUK6OWzzsJsIbGjU9ORXN0udVt60kXfRsgTUv1L1O9le8VwonpDIOA0yWuepZ6dO2
         9YOA==
X-Gm-Message-State: AJIora+v2fmLowezWlc6PdvUCO2DoczZMu7TTNKISIxO+OgyaRBklEcL
        aOzk4VnEmAhdIKy3lvOg9vwnY0u4LgkX04mP3SI=
X-Google-Smtp-Source: AGRyM1tTnjEKy1PAqxhIkhgJsM8EDdvdvX9csFM1KASrFrTyHF6cONT/3ZQhMAHd6iGBjCTq+R/HQPUDHcaDjJjyFps=
X-Received: by 2002:a17:902:d481:b0:167:770b:67c with SMTP id
 c1-20020a170902d48100b00167770b067cmr35105233plg.77.1655910206648; Wed, 22
 Jun 2022 08:03:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:903:2308:b0:16a:1b3f:f74b with HTTP; Wed, 22 Jun 2022
 08:03:26 -0700 (PDT)
Reply-To: sales0212@asonmedsystemsinc.com
From:   Prasad Ronni <lerwickfinance7@gmail.com>
Date:   Wed, 22 Jun 2022 16:03:26 +0100
Message-ID: <CAFkto5tMg+6s_ExUe9KSdLUYd-5dxWYs2fCGN8FGJofvS5QvsQ@mail.gmail.com>
Subject: Service Needed.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

-- 
Hi,

Are you currently open to work as our executive company representative
on contractual basis working remotely? If yes, we will be happy to
share more details. Looking forward to your response.

Regards,
