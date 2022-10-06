Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC6155F6385
	for <lists+kernel-janitors@lfdr.de>; Thu,  6 Oct 2022 11:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbiJFJWU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 6 Oct 2022 05:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbiJFJWS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Oct 2022 05:22:18 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4B998370
        for <kernel-janitors@vger.kernel.org>; Thu,  6 Oct 2022 02:22:17 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id bj12so3102129ejb.13
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Oct 2022 02:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=gfZGrH7a9yUWw9GpAG6sE4j56NOjTxXoEiSUkRLAXgU=;
        b=F6pZWBdUE40qWO/tnBW9sr4th3jm+y1J8/HuKkX4fdGpIN9XbF7bCmH29M0Vxsti0l
         j2YTkA2j2T9HdAfYzRae+L5oak84JpC+0LQ9Zr73sEFrL+phJeyfvNKnfHP3wkRxN4SW
         nT+DWYGYav27nltjFDv2c02TN4JeqBl+Jy7RybvLfxs3/NI8xSYAwMa1pwqdRLkztSYY
         h2Qln+Kum7owkKCUJvVmTTCMEUjrtA57tD78yGDouZIqKYFhlwbJNmjFh/7+fdpLk7D3
         cX4sQzBJWminktpvelda/EhNyDZDQYokIr/UXN27GQpMDsrhOsfD4tdcXVUvJ4oCIizh
         be/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=gfZGrH7a9yUWw9GpAG6sE4j56NOjTxXoEiSUkRLAXgU=;
        b=BOQNB7neAsI8UMmitCkd4Uw8JCV6te4IGtbOe/jzcIh6zTJ38TV4+pUvF+50rDVgo2
         U2KEaeJL8RAGGjpyX5FKhNDyqPMjJUhlTtFQhI2VO+2ft5d6A3TQaMcMDyoGHmCMNGQB
         SaeVTcQfAMfKRQheFJn0x5spM2ZHRmKWXDHbV6Y4wTaicS6zUhAnyJbjVLo/p4ZLvNhp
         QZ2a67P0dbQL7p9FqyehPNk/Wa1TqsrFpNZOOczySBdw5wyN6OnlyiLljTp3L5do4vlE
         iYcBaSYFpRXOJOHmv5vvDZ67cqhY+IBdalKO2lZnjT+NobLm/lBRBoPPkeHyX2swVwW8
         ngVw==
X-Gm-Message-State: ACrzQf2wAHtaTchowt0/X+IeSMU/l44Vz00pSZIY5ewFpEutgDdkaZlK
        kbG+zrjw7SswMu3+1MYgF2/3hD8DS1ti4pZ/ubw/UTEgiKc=
X-Google-Smtp-Source: AMsMyM5SPTgajIsbKATqyoE2FjbStcDaU4OeU6653kkHYOVryxlZ5FZCigr/jQjn168+9EHzr6leMpeY9/ibqcwYx5k=
X-Received: by 2002:a17:907:7b9e:b0:783:10cb:2826 with SMTP id
 ne30-20020a1709077b9e00b0078310cb2826mr3204710ejc.208.1665048135682; Thu, 06
 Oct 2022 02:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221005154852.320056-1-colin.i.king@gmail.com>
In-Reply-To: <20221005154852.320056-1-colin.i.king@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 6 Oct 2022 11:22:04 +0200
Message-ID: <CACRpkdavo3vM6rebx6QRjf43z6HwX7tJEcEGh7bmus8Qtp1Qng@mail.gmail.com>
Subject: Re: [PATCH] Input: dlink-dir685-touchkeys: Make array bl_data static const
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 5, 2022 at 5:48 PM Colin Ian King <colin.i.king@gmail.com> wrote:

> Don't populate the read-only array bl_data on the stack but instead
> make it static const. Also makes the object code a little smaller.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
