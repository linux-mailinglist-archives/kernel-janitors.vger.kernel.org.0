Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5B4240550
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Aug 2020 13:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgHJLY5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 10 Aug 2020 07:24:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40430 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726422AbgHJLVl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Aug 2020 07:21:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597058494;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1wbjRsGzwJSEIgmC6+jZ5HmKMMdsjr2TIwdTADa3P68=;
        b=KJCkJkb0jjDc5tCbiZLFEeDefar3p3nzvGoOgPEWWPsPSYw1iTonmAL1/i0LKaFlUhuRDp
        BzCNj8XPpltMuGLEmHlfsB5xA4rQ584zPNRdKJES/b5h2q3ISLXVEVr73Ia4+E5L7G3HIa
        PR7lGCi5k69zElt5JvmEhT8rf1EyyFE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-WtFjkCvuPmiVGj3HpsuBaQ-1; Mon, 10 Aug 2020 07:21:32 -0400
X-MC-Unique: WtFjkCvuPmiVGj3HpsuBaQ-1
Received: by mail-wm1-f69.google.com with SMTP id v8so2656479wma.6
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Aug 2020 04:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1wbjRsGzwJSEIgmC6+jZ5HmKMMdsjr2TIwdTADa3P68=;
        b=ugmBoVJfFl07YZRCZVQqYLibK4V0A7iB/X2ptDmqPPl1ew4Cx8yiNDswObs1K9S//N
         9M2z4LDhwqiEjuEK3bVZQzLEsszZHbv18kxX5aSItbONNDV2s3A2+ayG4KruvHoNK4G5
         U8PU4WGOxczdbB1t2fqIVJabpfI2ROCDSKR3vDCROq3P5vOSVvywvVxYvZF/AneAK9Vo
         0Ant56WNccqQUXYqQV46w8y6DWLvkcR64VnmZqNpB4xYS3di1oJgWbqcVikM77F0Ov6z
         UhVfb++X/WpxRigFaJPKAynjRAh1rOQpdzVafrvzlsLJ0blbj24Tyxx3d0Cuw7DIleIo
         3BtA==
X-Gm-Message-State: AOAM532QeifT7U1wn22TCn+uCx3WNiSOyF06xy15ppndMr2jAn5lg5aa
        8EUnLRb2Uk4n+jKLujJszpWtBafOfRwbaSubpck1QTbAtgWxrkGEE0A7kLtn2J5gU7hMOJh+EAE
        Ath9qrqUyEITpVl3URPvgjklqNOrd
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr24714533wmh.55.1597058491537;
        Mon, 10 Aug 2020 04:21:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4UxkLVkYR0qaII68uf1rniVKRN+p8dcjGLxPoccx8ZjhNhB4Iqyr7JqQEeHpxQbiDZVqm6Q==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr24714515wmh.55.1597058491320;
        Mon, 10 Aug 2020 04:21:31 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5d6c:f50:4462:5103? ([2001:b07:6468:f312:5d6c:f50:4462:5103])
        by smtp.gmail.com with ESMTPSA id o125sm23557595wma.27.2020.08.10.04.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2020 04:21:30 -0700 (PDT)
Subject: Re: [PATCH] kvm: selftests: fix spelling mistake: "missmatch" ->
 "missmatch"
To:     Colin King <colin.king@canonical.com>,
        Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200810101647.62039-1-colin.king@canonical.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bb65571b-555d-c5e6-1242-a12881a13e01@redhat.com>
Date:   Mon, 10 Aug 2020 13:21:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200810101647.62039-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/08/20 12:16, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in an error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/testing/selftests/kvm/lib/sparsebit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/sparsebit.c b/tools/testing/selftests/kvm/lib/sparsebit.c
> index 031ba3c932ed..59ffba902e61 100644
> --- a/tools/testing/selftests/kvm/lib/sparsebit.c
> +++ b/tools/testing/selftests/kvm/lib/sparsebit.c
> @@ -1866,7 +1866,7 @@ void sparsebit_validate_internal(struct sparsebit *s)
>  		 * of total bits set.
>  		 */
>  		if (s->num_set != total_bits_set) {
> -			fprintf(stderr, "Number of bits set missmatch,\n"
> +			fprintf(stderr, "Number of bits set mismatch,\n"
>  				"  s->num_set: 0x%lx total_bits_set: 0x%lx",
>  				s->num_set, total_bits_set);
>  
> 

If you have a script that generates the commit message, that needs a
fix. :)  Queued though.

Paolo

