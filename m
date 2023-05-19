Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5AF709603
	for <lists+kernel-janitors@lfdr.de>; Fri, 19 May 2023 13:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjESLOX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 19 May 2023 07:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbjESLOT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 May 2023 07:14:19 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB2A10C6
        for <kernel-janitors@vger.kernel.org>; Fri, 19 May 2023 04:14:17 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-965ddb2093bso501934366b.2
        for <kernel-janitors@vger.kernel.org>; Fri, 19 May 2023 04:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684494856; x=1687086856;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmxaI1amCfTksu6ynk2557PwK0HJxrBQmYIx/Pz5hBs=;
        b=pviExDcWLoo1q+E5mfEFFHa0FJB16aIk1ZZnWn6meJki09hox1bLGNZd36uVzbalpp
         0me1ktVzf34dxp7BcUGGzozR5s8FH9HCRZyu6lAtZNZhQUpf4wAIc76xL+mlsOOUDIlz
         Raq7WsROSxl1oP+Wu8K3u7jPXv7twPdSaAR6ap4XcvIcZ9F22oadBcyMPmHXituZsho0
         5VgRRHEug4sVKuxwfDy2fVcL4RouBxNdyBzxjZauLiEp3nriBv1R07hQoP/3mMsRt1JA
         wuOTytnsekcYIEV6t4q9EGZfB6NY0WGhEwXNh7sP1h7pnlo1VRZkTUB65/cuY1l+T/nT
         XGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684494856; x=1687086856;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmxaI1amCfTksu6ynk2557PwK0HJxrBQmYIx/Pz5hBs=;
        b=Oq6YBAizjCK02OQepOnKYsXL+I/on/hMaa2Ekqb94ClZb3rKuA4kC908oFhViVhZPC
         PvYSdvv8eqUHkysRcA5QE53nNKKO1pSc957he3S4OmNHOwmvI69a4GyNIIxdTjdnOt4P
         2cMnthqsVO5hynpTRKApd+ftTFiATx7YzVXYdOzdFIYA3S/QFiyyRQwgiTcPNhT6p4B4
         k2wCbdTXtUsqqYnG1dOrXBMcllfKn2VOKldhjeNT1a5Zcf4hIwLA/EAz3WiuRE8NsmcE
         7reJt/L8o9H/0pu5exkAE53oaHMHd/dzl2nRyn0SkEtZqnkAXeCEL55BvOiOb74Ib1Sp
         8+UQ==
X-Gm-Message-State: AC+VfDzxVLxVweGKfAyW1gAUs1/wam2blVmj7uJZT8uxyTx1wzfN0apk
        ELs5qt5u4VjHDo3dJ0jIHwK44xB5Mv4Re2Qx/VU=
X-Google-Smtp-Source: ACHHUZ5xB5mRDs6MgIejz8B/S39N9B5uhgmjhEbIhVKnsZPFFaglEwROpbqvTT/AE/q+cECEHGD06Gjj5xmiy/gDjaU=
X-Received: by 2002:a17:907:74d:b0:94f:7edf:8fa1 with SMTP id
 xc13-20020a170907074d00b0094f7edf8fa1mr1222023ejb.32.1684494856209; Fri, 19
 May 2023 04:14:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:7dab:b0:94f:7d03:8e8b with HTTP; Fri, 19 May 2023
 04:14:15 -0700 (PDT)
Reply-To: ninacoulibaly03@myself.com
From:   nina coulibaly <ninacoulibaly199@gmail.com>
Date:   Fri, 19 May 2023 04:14:15 -0700
Message-ID: <CAM7Z2JC01HK==wZRHOUzUMt1UMX0mT2O8_X5AXXL-=jMT2Y+gQ@mail.gmail.com>
Subject: from nina coulibaly
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

Dear,

Please grant me permission to share a very crucial discussion with
you. I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibal
