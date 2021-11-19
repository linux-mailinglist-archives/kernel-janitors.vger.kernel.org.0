Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9EC456F67
	for <lists+kernel-janitors@lfdr.de>; Fri, 19 Nov 2021 14:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235333AbhKSNRv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 19 Nov 2021 08:17:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbhKSNRv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Nov 2021 08:17:51 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DD4C06173E
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Nov 2021 05:14:49 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id de30so10151118qkb.0
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Nov 2021 05:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HR5QiUUsJAbHQWB9m5yaWF0hUgIrMOiOR5Z9Xwz9lnE=;
        b=f2eOBTz6OPpcwmli2fs3JisF4biM86jGkiAejvgSXx9aQHdP76TKbunhALJKkVzcVv
         0cmq9Fx5UU01xiVsjvCvH5rit5pIkrfK9+e+/L3kq1NCCG/8Rgd0TYCMVgSXBf9vgDz7
         D2T/zelssMgju8bcMIb5O1PB6FVGhrKhlT/xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HR5QiUUsJAbHQWB9m5yaWF0hUgIrMOiOR5Z9Xwz9lnE=;
        b=bymDSERWE2INy+eSzBF5dhSEOHt2lnMLEKe0vx+l6fiv8BkNCAeWZSw8AITfvigYqh
         sVKKjiN/PWwwbCO9upPYWDW+34lRUGLkHxVWybzSW0K1nXQ0O7dgv/TZr6uXrp7yLQvM
         j1C6KHJLxDXkIjDQCCLl9a1XGARLXJkJ+SMje6jZTOVnpLY/OzjZW6zuVPPVLj24DG4H
         Xc3JAybr3Tun5PMOZlg21bXgOHdfMl/y2biUOR/r2LeGGNPj2vnSk3/e68aSsseYqvn3
         83J6tGeJkKumJT1Zyhw+LCxXtwdam/GvnBntX+ARGrHQJWlSiKkdhoQpnI8FWyJanoYp
         Matg==
X-Gm-Message-State: AOAM533HO36711mFRX7fKPD8mY9P8FHlQU/54jVwPYZq5SFC/8MfttPZ
        Oy6en3n2WpZO9Wgq6DpoRcp4kw==
X-Google-Smtp-Source: ABdhPJwadsU8VaU3ROuC9an1iL0IlzAyf4YliYBtHhaAxXHmJCEKFp94Srij+FxPpAzpi/nTn7Ai7w==
X-Received: by 2002:a37:8607:: with SMTP id i7mr28302102qkd.159.1637327689057;
        Fri, 19 Nov 2021 05:14:49 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id t15sm1542305qta.45.2021.11.19.05.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 05:14:48 -0800 (PST)
Message-ID: <77cff7ec-0787-5a19-0db6-c7d9e34f7258@ieee.org>
Date:   Fri, 19 Nov 2021 07:14:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] net: ipa: Use 'for_each_clear_bit' when possible
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        elder@kernel.org, davem@davemloft.net, kuba@kernel.org
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <07566ce40d155d88b60c643fee2d030989037405.1637264172.git.christophe.jaillet@wanadoo.fr>
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <07566ce40d155d88b60c643fee2d030989037405.1637264172.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 11/18/21 1:37 PM, Christophe JAILLET wrote:
> Use 'for_each_clear_bit()' instead of hand writing it. It is much less
> version.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

I know this just got committed, but thanks, this
is a good improvement.

					-Alex

> ---
>   drivers/net/ipa/ipa_mem.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
> index 4337b0920d3d..1e9eae208e44 100644
> --- a/drivers/net/ipa/ipa_mem.c
> +++ b/drivers/net/ipa/ipa_mem.c
> @@ -266,9 +266,7 @@ static bool ipa_mem_valid(struct ipa *ipa, const struct ipa_mem_data *mem_data)
>   	}
>   
>   	/* Now see if any required regions are not defined */
> -	for (mem_id = find_first_zero_bit(regions, IPA_MEM_COUNT);
> -	     mem_id < IPA_MEM_COUNT;
> -	     mem_id = find_next_zero_bit(regions, IPA_MEM_COUNT, mem_id + 1)) {
> +	for_each_clear_bit(mem_id, regions, IPA_MEM_COUNT) {
>   		if (ipa_mem_id_required(ipa, mem_id))
>   			dev_err(dev, "required memory region %u missing\n",
>   				mem_id);
> 

