Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C20576E5738
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 Apr 2023 03:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbjDRB6Z (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 17 Apr 2023 21:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjDRB6Y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Apr 2023 21:58:24 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1730D619C
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Apr 2023 18:57:50 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-51452556acdso1894010a12.2
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Apr 2023 18:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20221208.gappssmtp.com; s=20221208; t=1681783069; x=1684375069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7vLZY5J50FSt8lwsCIHqb0KqBwYt8YdqEgV1/N0h/I=;
        b=NOiNaHH5RvWGgDQE3cwC4NK+sGVh4LMa60CHcMcMk0Ns8/Yq5MGld5dWUjwTse7vyl
         sKC5+TdqTJ0g1DA3AJel0DSxVVoIfHlh6fzn60kvCJygfZLA3ZNhsNlH90HskcfW8wyr
         aEM0bRz+roJWmD5kJK1PECX7UrfFX9MGO6zUqJiSiv6N3eBLNsftiuRiFL/zWvI75fC+
         oZ7uEWVRwepxdfHNbdJIMcfw1NY97WRjW4XrMM06UeI+bfDM4s9VuKIC+wiCKVhur8qy
         qgcsF5dR0mHZLPLlOBV3tsbo+zGRrlytO+pk1VNiCHWtagqs7/gi0BKWFu2SiZdVeUK9
         tu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681783069; x=1684375069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7vLZY5J50FSt8lwsCIHqb0KqBwYt8YdqEgV1/N0h/I=;
        b=bEE6PyqiILtEMcgtEWdpOO0Wr8bowOaH1VfEmu/Oby0+o5cYlCI4bWXcAsAH/CKriR
         fq7Sgsqj85NhirEPMNChkw0oMwY8qCPVOEjOOYYNxsxQjqwGwBvXsaMmzkPAGLLT5fos
         O2mAREk42gw3aIvU1HoU+zkb/2QvFubS9YmoxhEMjF+2SMAtTuxjLWpmxZV+yA4iE5Mx
         AgoHUKvQb8yLL2IuZ3ErcQhrliOm6SVGoVFeohUTyBc2XRIWnuzYJAAGm19KzSBgUrc0
         wwjm8uLss2QJOmfd2OvCf3zS6Rrtoc8+QvQnzLg1ZhITrx6jdfzBc65ZZ4cs64J3j7vh
         Tkcw==
X-Gm-Message-State: AAQBX9fAwegIffJtnzBK7ui/M6rurhxg3QA9Mvj0Jgezftj8kc+WvnyZ
        bM7wXzoBLuaoP3I3J900q6cGHn6FjLflSbuWyiKWpw==
X-Google-Smtp-Source: AKy350aHPlYlChJxF4HQlAb3s/ccQQXKkLuj/0YwpGffvcRq+tpfEP9ObhroKMearnzP07TrPYVfAw==
X-Received: by 2002:a17:903:230c:b0:1a6:b78e:de0f with SMTP id d12-20020a170903230c00b001a6b78ede0fmr590735plh.51.1681783069405;
        Mon, 17 Apr 2023 18:57:49 -0700 (PDT)
Received: from [192.168.33.147] (124-110-25-102.east.xps.vectant.ne.jp. [124.110.25.102])
        by smtp.gmail.com with ESMTPSA id jf7-20020a170903268700b001a2135e7eabsm8342694plb.16.2023.04.17.18.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 18:57:49 -0700 (PDT)
Message-ID: <4e5a887d-1c8a-5592-9dcc-fcc85ec7e319@landley.net>
Date:   Mon, 17 Apr 2023 21:13:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RESEND] sh: sq: Use the bitmap API when applicable
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-sh@vger.kernel.org
References: <071e9f32c19a007f4922903282c9121898641400.1681671848.git.christophe.jaillet@wanadoo.fr>
From:   Rob Landley <rob@landley.net>
In-Reply-To: <071e9f32c19a007f4922903282c9121898641400.1681671848.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 4/16/23 14:05, Christophe JAILLET wrote:
> Using the bitmap API is less verbose than hand writing them.
> It also improves the semantic.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Tested-by: Rob Landley <rob@landley.net>

It booted and ran for me.

Rob
