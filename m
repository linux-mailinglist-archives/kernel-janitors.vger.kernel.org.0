Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D3A212682
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 Jul 2020 16:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbgGBOl3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 2 Jul 2020 10:41:29 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:47888 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729551AbgGBOl3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 2 Jul 2020 10:41:29 -0400
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <guilherme.piccoli@canonical.com>)
        id 1jr0P1-0001n7-9C
        for kernel-janitors@vger.kernel.org; Thu, 02 Jul 2020 14:41:27 +0000
Received: by mail-ed1-f69.google.com with SMTP id o3so28250987eda.23
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Jul 2020 07:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5T1+UQfX6pEeNwUce2bRhBzSqya6/7UUz7vTij4e9c8=;
        b=Hxdy4s2j2UBkXtGDRstCizdCUSJ1zc4binfHF0gW2eb9okeRQWQTZm/Dk9W3FfBozy
         cRRZ+rzlg+NcsinjPv6AQSPj0MSvdWFX71FxzQ1QKK9HELI0WYK7OWa+RJU7n+/LwDP5
         S/29muUk7/Sp5mU6jKaJwD6x/f4Hh37MKWbtd2dkWrsma+ttFapwDoMkkt1ov1BwW86G
         iUWRQV93Fwf4T0aKpxuG8aSC9+TKIMzj1mjN8nvxY62U//OLoKsCbyUp9715i1vrQxw3
         LR+P8fro8SG/a+p+ms6ySE2Enp7B5a1WUzHY+rYreG3OmjranqKPARin8ug9kLhCPALh
         N5aA==
X-Gm-Message-State: AOAM532Ev64882p334r8Ha+4sQXcE36zOpz5iFV5+D8HVEA5tcInaEHD
        D+zOcBqYQGDUBYCWHQnmWGPsmVuPgAuSq4We2wT1cIuZFc2WiefpBkntIxR2ivTaB39hFOJVByo
        1k7My/212PL3Zi269ynWYcXXkWhcs0gg7v9Az/Crnl1BBZdfRDPa+nLJU0VqjPw==
X-Received: by 2002:a50:f149:: with SMTP id z9mr35819637edl.167.1593700887012;
        Thu, 02 Jul 2020 07:41:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQQ7loNtaLR0+jJmnqpDfGBBHzTUDZLonufSCrcfmOD7H0vkh/Hs5ZKvmSNwfyCLMjhvtOQI4yxlNus9E8rmA=
X-Received: by 2002:a50:f149:: with SMTP id z9mr35819615edl.167.1593700886870;
 Thu, 02 Jul 2020 07:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200702113502.37408-1-colin.king@canonical.com>
In-Reply-To: <20200702113502.37408-1-colin.king@canonical.com>
From:   Guilherme Piccoli <gpiccoli@canonical.com>
Date:   Thu, 2 Jul 2020 11:40:51 -0300
Message-ID: <CAHD1Q_yy2gbBkd31oOJiJk2TU3K4wTV3gVtjLiQo1FW+e=5ivg@mail.gmail.com>
Subject: Re: [PATCH] md: raid0/linear: fix dereference before null check on
 pointer mddev
To:     Colin King <colin.king@canonical.com>
Cc:     Song Liu <song@kernel.org>, NeilBrown <neilb@suse.de>,
        linux-raid <linux-raid@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Great catch Colin, thanks!
Feel free to add my:

Reviewed-by: Guilherme G. Piccoli <gpiccoli@canonical.com>


P.S.  Not sure if it's only me, but the diff is soo much easier to
read when git is set to use patience diff algorithm:
https://termbin.com/f8ig
