Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D6A1E4051
	for <lists+kernel-janitors@lfdr.de>; Wed, 27 May 2020 13:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgE0Lmh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 27 May 2020 07:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbgE0Lmg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 May 2020 07:42:36 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2ACAC03E979
        for <kernel-janitors@vger.kernel.org>; Wed, 27 May 2020 04:42:36 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id nu7so1453597pjb.0
        for <kernel-janitors@vger.kernel.org>; Wed, 27 May 2020 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sZeKxoqsJfHmJKWaGZ+FoPVmzG1uJu0Aa8XuYZUp/Ew=;
        b=VgXBx/n9QvB+YvDn6NYJLz6oVH59pjcPxJRh65BhLU3L7ZuClmM3L2k6D/626PY954
         QQyeqbu8PgPXQCenizXc2i0fC76rQLs8Wigkf4p7SMgbycDSZCVefXPmN+8UV1pawScy
         A2EFa4ZQzatLH1XSkfSK5ym9JQ6jWznNerWZ2LgW+2s1KfuNPJGOAi6T/vXRasdxGG5O
         KuIlKlb5pj0K1QBhbpZ77dep0qpYB5q901mYzXB6eaxxX+5v0gV/Js8+y+LOrYVQC57G
         xNoyGX2CFF0yNvJxOJQSSqMfHZ+KtdVhLsAgGn6KSWyP6rnnd7SyNkWQQHHdVyiC4nC7
         N0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sZeKxoqsJfHmJKWaGZ+FoPVmzG1uJu0Aa8XuYZUp/Ew=;
        b=BH49I/gc5LibxHpJUvT4kC+yOuZa+P8Yijs9ELAhu2KivaZW+LlcLqr2fZ5rA4bL+K
         yd0E2kbKxOVlCC268aR9Z6Vgh47WYHMcW4o9h9uui78QTEPjV5PSwGQ3jzugRh+3NbFB
         5BUtNQ8+akPAKtyplE3fhfIAhqbEKi70WFvVR0oVf2lBNuOJugLQj3NBROgQSkz1peqD
         8UJm+6kSASCxvwVDHzF+mrB7fwzxMsRsHPQ7RZdxe6U4p12MK5T/dCZJSJfECMVjKfhN
         pPjle9tKMVErq+baAdqVfreQxBzXnS8M9FslOE4PWuCyU+Q9MFuHInnVSAfj6dIDVDoE
         ea3g==
X-Gm-Message-State: AOAM5336uJjLSty89vbGaYQTxBMG+N8IymsizTYwYEwuN9WBfgnlrSn7
        DqAkS+ttp6TcLGWJTmjc17r5nSTIq2/cUg==
X-Google-Smtp-Source: ABdhPJxEIjzI7FCnmm+8XenXCkMLJM7xic+d04No6urE0jxruzEp+coK6xFyXzPHJohz4u+UUWTTdg==
X-Received: by 2002:a17:90a:26a7:: with SMTP id m36mr4607945pje.28.1590579756112;
        Wed, 27 May 2020 04:42:36 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:2cc3:8599:f649:862c? ([2605:e000:100e:8c61:2cc3:8599:f649:862c])
        by smtp.gmail.com with ESMTPSA id v9sm1981838pgj.54.2020.05.27.04.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 04:42:35 -0700 (PDT)
Subject: Re: [PATCH][next] block: blk-crypto-fallback: remove redundant
 initialization of variable err
To:     Colin King <colin.king@canonical.com>, linux-block@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200526224902.63975-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <feb4f798-ce3b-6a08-e462-ab23bd223b18@kernel.dk>
Date:   Wed, 27 May 2020 05:42:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526224902.63975-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/26/20 4:49 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.

Applied, thanks.

-- 
Jens Axboe

