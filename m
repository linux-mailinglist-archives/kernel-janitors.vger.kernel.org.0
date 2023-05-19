Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFBD7092DD
	for <lists+kernel-janitors@lfdr.de>; Fri, 19 May 2023 11:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjESJUy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 19 May 2023 05:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjESJUv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 May 2023 05:20:51 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536BD18C
        for <kernel-janitors@vger.kernel.org>; Fri, 19 May 2023 02:20:50 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-437e8282c1fso280330137.2
        for <kernel-janitors@vger.kernel.org>; Fri, 19 May 2023 02:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684488049; x=1687080049;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrsFs7FLoRT0zD1iaY/s2AiDiUEaUePPr9gNb73ZaTo=;
        b=qUo0Kcae+w8mvYN890TsKCQZwMAzl0mW5V0VI9yhCu/88A0irNabCf1eFEJhmN5xhl
         4aAc8koT2IyCcF4qZg65m8Qg6CHJC2jrll6cOmHhUSc/9XJHXC/GuJnMi6t+rjEbkebX
         cysmrz2QZUSUQjQHHU0OvamZ7s77knqsU9+5Y+D4lm01loMa9GbunicixFfdUcdRcRvU
         lCSB0X+aQd9P3sG3NAtH5ax2D+uSi0Ye+PEQV9XkZQ+fKCQvcDk57oFmE3SZLa1SRFVz
         vx5voRp8M+7Uc6uM3xIIR1LDj9pJE8rroJ6YGDysR1ii3NiHTNHWBmYg1R18A9J8tstj
         xlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684488049; x=1687080049;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrsFs7FLoRT0zD1iaY/s2AiDiUEaUePPr9gNb73ZaTo=;
        b=QF2cKGULxtYeacDA5xJB0M6YU/0KfmmMMHkmJsrdExxneZ2/x7cVdpPIIt2la+xCwz
         UPn/s2mDILElnfcg3oy8S7OSiGTivU7wDpjJVKc6Ik1qC6z2U+CPdaCvc8c+j9uIi7iK
         Ago5tqT2HtQR634eSe5zxAjOV7oen3d9hblKlK/iO2+iioI7Zzn2fN60zaxcNQdgu+OY
         ul39bkvIEetq92KcOMR7tK0S+IY/1UwawxnEqt/UTCgHOEXqgadaoY1oD0hFUtC/W9Fy
         +4x8yGkYZOiXkwr4zUmtFXTyO/khY5AmH5J2otcrQUU7SIkpl/P3T/gU2cz9NnVOEX1g
         Po1Q==
X-Gm-Message-State: AC+VfDwQtmkTkXESzJBAv9bm+nBX2iyz+CkYAabk++xqRL51+4TLog74
        cb6WBqqQ6eS7pZWWvuZvdInp/iZLLlKhpOlBA/E=
X-Google-Smtp-Source: ACHHUZ43t22GOxXMhl7F3mXITwezfoj77N1vKiNn81o62Y5syUtcLbRysis9DAfjI8JE4pYYbLWhc4z5af+yoUBHLLY=
X-Received: by 2002:a67:f68f:0:b0:434:8873:f8a6 with SMTP id
 n15-20020a67f68f000000b004348873f8a6mr459238vso.13.1684488049388; Fri, 19 May
 2023 02:20:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:b925:0:b0:3d6:920e:48bd with HTTP; Fri, 19 May 2023
 02:20:48 -0700 (PDT)
Reply-To: choipark90@yahoo.com
From:   choi park <fi654827@gmail.com>
Date:   Fri, 19 May 2023 10:20:48 +0100
Message-ID: <CABQ7isioO=Vg0SeSHfgtXsLiSY85qqshCu1Z5Q6=9J6oKx5FRg@mail.gmail.com>
Subject: investment partners
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

-- 
Hello my friend how are you doing with your daily activities  I hope
all is well, well I got your contact as I am searching for a reliable
reputable person that can be trusted as my that client  Mrs Ma-Ri  Kim
from  Hong Kong   Directed  me to get her someone that she will trust
to invest part of her money outside Hong Kong   for her under aged
child  if you are interested let me know I hoping to hear from you
Mr Choi Park
