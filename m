Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B48C209A2B
	for <lists+kernel-janitors@lfdr.de>; Thu, 25 Jun 2020 08:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389973AbgFYG7n (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 25 Jun 2020 02:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbgFYG7n (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Jun 2020 02:59:43 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A10C061573
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jun 2020 23:59:43 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a127so2590672pfa.12
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jun 2020 23:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=h3cJifZz1u8LBc/y30E1modeSB1/pxO5mM8WcMl5ag0=;
        b=hIUgXPa7R+lsDLQ6W455cRmyzlZMJSCyD649EBCHTUfbq4cROvPHlO3utX9dP1uY6L
         TDn6yWLvYVwItyWCrTz0symu1Hp40iPYSmNgRqySCeDHGiqiKRKOrZp/OHyNKCOwPAIv
         cO+g0PMeDLYS3c7G/YfGzqqPoZhss325oz0+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=h3cJifZz1u8LBc/y30E1modeSB1/pxO5mM8WcMl5ag0=;
        b=FPspxzAMJBqbTMUG2gPMpRjAYMLOg802M4vXzzMheHg6zXtuaJNAzWEisIKjguxPLj
         lgp5AVV2QkaGf8UzlJS4NdpPZdV20FZ+h9llL0Rbk+PJpWE5lx5P9PhPOH6pXaQPR0ae
         01XDOcalxgUZahgSvu+mQmCmKdTE0s6fFIOMxblY8jp3CyaBUgVt35URtU5ml6/oBCuC
         Ma+ykv1a2FTpj48zxwF3UJ3oGfG0sSHPKrZpdDJSkQDWUBHbQwpb6IIUX6I9YXXLVFtL
         065VCacXyMu1l8Yfr0vxqkTgr+2clPe/7wqu44uMErYWZFygm3IvWxo1TevQeXeQ9pJA
         8kSw==
X-Gm-Message-State: AOAM531i31K7NGfW23b/S5ZXu1HW/J0xPS2fZ6HXZSR2+wWH+fKUkhIz
        GPin41jRqvLL23MxpPT//5cNVw==
X-Google-Smtp-Source: ABdhPJyDXfB/vfATD45LCtZwbIvnX9Ky1w2z2exmM0w4aKL5HLtHcZfvv0hqfh3i1EC7be25yqvHZA==
X-Received: by 2002:a63:7c56:: with SMTP id l22mr24439286pgn.127.1593068382595;
        Wed, 24 Jun 2020 23:59:42 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 21sm4250390pgy.20.2020.06.24.23.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 23:59:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200621083315.883209-1-christophe.jaillet@wanadoo.fr>
References: <20200621083315.883209-1-christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] kernel/cpu_pm: mark 1 function as __init to save some memory
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        bjorn.andersson@linaro.org, dianders@chromium.org,
        gregkh@linuxfoundation.org
Date:   Wed, 24 Jun 2020 23:59:41 -0700
Message-ID: <159306838110.62212.10303992077632246358@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Christophe JAILLET (2020-06-21 01:33:15)
> 'cpu_pm_init()' is only called via 'core_initcall'.
> It can be marked as __init to save a few bytes of memory.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
