Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F15D24F2FF
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Aug 2020 09:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgHXHTv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 24 Aug 2020 03:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgHXHTt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Aug 2020 03:19:49 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC3FC061573
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Aug 2020 00:19:49 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id b66so4896687wmb.1
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Aug 2020 00:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A4jrcUKhNyq6Ips6PWENqMHRhy4MlDm4qFkTIUeY6sU=;
        b=Zh2M+CReCdB2DseDfEg+S/ILDu5sh9phoSgnmyvis+VRzOt3gmJamiBVybr2DBJ0BY
         cikhFUufbOjs789a2MCxgb3HIjF5D3/xa9DbYXZ0kRAf8tfyA2EUfVcpGdTcK+FZOJ3a
         rjti/cvJ4St0QbexsEFngNr4lWMcMRkIyU1WhRatyXjQh4bPiTByH5oXVqfnHTU/AiuU
         gZAwrZL92ny/djvuJ23htyoYiQ7ATW6XAODpulq8J8gGmAaE3lUt49DwuCXZgQiTVgz+
         vMXraotcCTAvaMM2+fq3QYvAxb/HA0ah5c3QYsx4ZXyMlPXFLS/5OA0QGc7MwEeo0NbG
         Wi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A4jrcUKhNyq6Ips6PWENqMHRhy4MlDm4qFkTIUeY6sU=;
        b=c/UIEWhUMB6H7fseGbzDQkoVPQcRmk+L4EHtZXmyc/wi8NrYcXuvBw+Uodhda26ir7
         72O4m4EPhyPrzGxcuO38mH62KapoLbzRO6YcX5KmvCzF6HX4Vky3skZi+OFUzibGWlRG
         dyrGFT5lHync04v1wJ0hN+k0Gxc6K6tuv6aunOGofvDhsFuHjFQNnIDOtAj9IA/QeBjs
         o1q8y35FxDsV3YEBGvqsKDDk4rkKdP3CUvHsPlIHFhWnSQCPQQo3RIb8nhpyXF2jsagW
         JQzcssK8+G0+UYtht6FeV3FkdDQ9AI1lzezJdRXpDjsDagaaw9FS1WHs6AOclocOEsAk
         q0VA==
X-Gm-Message-State: AOAM531VRkD1eAGEXoFEVtbMHkaDY5Hmdku7kPjk7K5vYja8bV1RSyel
        Oo/Y2I+QNOFDTp7ij3O3wcTPTw==
X-Google-Smtp-Source: ABdhPJxSuUa0KM13DRe5+ateKWf+FPyJpUyDzLii4cr5Vd9MNz3oLrpbagXrGXXemMNa/KjKiddxrQ==
X-Received: by 2002:a1c:16:: with SMTP id 22mr2436523wma.75.1598253587747;
        Mon, 24 Aug 2020 00:19:47 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:cd42:2fa4:120f:76b0? ([2a01:e34:ed2f:f020:cd42:2fa4:120f:76b0])
        by smtp.googlemail.com with ESMTPSA id u13sm7501851wmm.20.2020.08.24.00.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 00:19:47 -0700 (PDT)
Subject: Re: [PATCH] drivers: thermal: Kconfig: fix spelling mistake "acces"
 -> "access"
To:     Colin King <colin.king@canonical.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200810082739.48007-1-colin.king@canonical.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c317ce98-c20d-3c24-2f77-1758dc784de9@linaro.org>
Date:   Mon, 24 Aug 2020 09:19:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810082739.48007-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/08/2020 10:27, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the Kconfig text, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
