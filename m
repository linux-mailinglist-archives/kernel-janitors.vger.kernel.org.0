Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26A5571710E
	for <lists+kernel-janitors@lfdr.de>; Wed, 31 May 2023 00:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233626AbjE3WxQ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 30 May 2023 18:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233582AbjE3WxK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 May 2023 18:53:10 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CF0192
        for <kernel-janitors@vger.kernel.org>; Tue, 30 May 2023 15:52:55 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-64f47448aeaso3726101b3a.0
        for <kernel-janitors@vger.kernel.org>; Tue, 30 May 2023 15:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685487175; x=1688079175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ueHzQ8Wa2okWJ0fmfLLo52MhtIRbhBte5ZK2h7JXro=;
        b=Uq6HIEJPqhlC136Vr3uDaJx/LiLYTMr0ktJdq1gXrz3vbtj1rUBgix8iIftoJRJE0u
         s0n2ZmNyvaXfahlPmLFPgKGLTC1R/PE/AexOHlFF+h4qCqm1X8Gzxt4UGEys9DU2AxMw
         qJLvr9ylGvgEI/uCFvZqM2M+37XDZ6hkc6iNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685487175; x=1688079175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ueHzQ8Wa2okWJ0fmfLLo52MhtIRbhBte5ZK2h7JXro=;
        b=Gs6+OScyhWVJPQbA1EPpMytjcrS+KYSWK1V2d1ayxD9THMvsGiVL/z5YcuG1VpoT7I
         hQJ26wg2NcN2EDIMS3zYhhGFlBbMPLFu+v779pEcm8VgumvPBqd2Ifdncbvij6ZL5MFO
         oeEg1QOSK3Khy0Y+z4SqxYmAd9pONfprSfcl227lgokXMhbsPdoxv05Uutj5ZtfxS6dW
         7vFKDdOzvMiwhByoaJ7MVE3NeZ/n2yscZSZ81jGAXE8Jj3xxV258Hb6VhbhgSN30di26
         avioAfVwIzVUHZxFLBNn0pkNoRxBm+W9qhKjesdojlZOMWSXG5201V6Z4TgcwW7cg/2J
         a4IA==
X-Gm-Message-State: AC+VfDxCAyJvjX62lw70gBbZpkG+okglck4MBjMZ2oFgj1zzNMLobU1k
        FNVa0T+w45fjEzzN3Y0BAQt/Zw==
X-Google-Smtp-Source: ACHHUZ5su34kJvySFp+kM+iyarUXA7DMydBxSrLfDVvbUYdac46CqF1AixOCK5hkgoXXlYbWPcfdPA==
X-Received: by 2002:a17:902:d4c8:b0:1b1:76c2:296a with SMTP id o8-20020a170902d4c800b001b176c2296amr312445plg.60.1685487175088;
        Tue, 30 May 2023 15:52:55 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id bg6-20020a1709028e8600b001a4fe00a8d4sm10829640plb.90.2023.05.30.15.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 15:52:54 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     christophe.jaillet@wanadoo.fr, Al Viro <viro@zeniv.linux.org.uk>,
        brauner@kernel.org, ebiederm@xmission.com
Cc:     Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/2] binfmt: Use struct_size()
Date:   Tue, 30 May 2023 15:52:50 -0700
Message-Id: <168548716819.1348275.7939799619978451997.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <53150beae5dc04dac513dba391a2e4ae8696a7f3.1685290790.git.christophe.jaillet@wanadoo.fr>
References: <53150beae5dc04dac513dba391a2e4ae8696a7f3.1685290790.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 28 May 2023 18:20:24 +0200, Christophe JAILLET wrote:
> Use struct_size() instead of hand-writing it. It is less verbose, more
> robust and more informative.
> 
> 

Applied to for-next/execve, thanks!

[1/2] binfmt: Use struct_size()
      https://git.kernel.org/kees/c/e6302d5a285b
[2/2] binfmt: Slightly simplify elf_fdpic_map_file()
      https://git.kernel.org/kees/c/36650a357eac

-- 
Kees Cook

