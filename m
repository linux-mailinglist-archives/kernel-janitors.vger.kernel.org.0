Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D861F9355
	for <lists+kernel-janitors@lfdr.de>; Mon, 15 Jun 2020 11:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbgFOJ0V (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 15 Jun 2020 05:26:21 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23389 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728861AbgFOJ0U (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Jun 2020 05:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592213179;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hZRUtaUJ932ZlCQQbbYzNzjvtVWhAHymSOYbwBdTnCE=;
        b=GCF41UUUj5L8LC+phRyOd/CJ5TKqT0QpjlDliDuhwPrFtrVDntmWpVEoM7iaFKsrv6fAbb
        QIkZTOr9sZvpsB0zDWWUaiv/ddKIFh2ym4l9uZ8a2+e8BBA7fE2yyFwObw7XK1pvTGT4bZ
        uEqMJ6qK5sduNh5mn96Fv7jVZ3dM0U8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-_QBzmyK8Mb-FwNXyqheBdg-1; Mon, 15 Jun 2020 05:26:07 -0400
X-MC-Unique: _QBzmyK8Mb-FwNXyqheBdg-1
Received: by mail-wr1-f70.google.com with SMTP id p10so6816536wrn.19
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Jun 2020 02:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hZRUtaUJ932ZlCQQbbYzNzjvtVWhAHymSOYbwBdTnCE=;
        b=UyYx3kQFe15q9zgwvTgJusSROcS4QHNcaF6VsxjUTweRuXhJnuGNnvlyqt5bdC7+Os
         7hDfaYWfC+LEIum3PaGCk5Qs4rK3BuYMzD5zHEJnxTAerszqogRGVyEcVt6afdImXepc
         8unG36DqHGQ+7JWrnWin7T+TsLiCcpOjxcvi23oot2jBTkk1RxDaf38yYqtBh3u6WtIi
         8FgFavzao4yPcP/ifjeWN+G7sbsFvSmrt0+S/5FXoa3vThFnI6FlW/tnJlQ34PDiJgJw
         IB1TmtuOFlLYXStqwjiuCA54TKgMt7HOPvNnge+tdB+G6tXc36fE8GFoJiA4GfeLIC2s
         LGng==
X-Gm-Message-State: AOAM531MCedUMBmB9uKmO3htGiHyVL7Muebi4DWuFTaxN0erZ1spsv2c
        g3Ts19qQY2EVylHB7FmyghfeP1ysqWsRn+8NNPiIvuxo/wp0gr1+jDv7t+EVzxhXlFwNfqm6C9e
        QNgpkTGkJNxMd7YXQOaWa5Wdx3/kl
X-Received: by 2002:a5d:500d:: with SMTP id e13mr29684526wrt.150.1592213166872;
        Mon, 15 Jun 2020 02:26:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv8DVyRZi9qtb8K0ghXXPE5Md7jQA6TvmLQFzaSBYlaUpm2+z2htDOIiu8mMzNA9/r75JKzw==
X-Received: by 2002:a5d:500d:: with SMTP id e13mr29684499wrt.150.1592213166643;
        Mon, 15 Jun 2020 02:26:06 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.170.5])
        by smtp.gmail.com with ESMTPSA id t8sm21120194wmi.46.2020.06.15.02.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 02:26:06 -0700 (PDT)
Subject: Re: [PATCH] KVM: MIPS: fix spelling mistake "Exteneded" -> "Extended"
To:     Colin King <colin.king@canonical.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200615082636.7004-1-colin.king@canonical.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8719ff21-8344-a4d0-112b-c7876f0b6f29@redhat.com>
Date:   Mon, 15 Jun 2020 11:26:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200615082636.7004-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 15/06/20 10:26, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a couple of kvm_err messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/mips/kvm/emulate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
> index 5ae82d925197..d3d322f70fe0 100644
> --- a/arch/mips/kvm/emulate.c
> +++ b/arch/mips/kvm/emulate.c
> @@ -1861,7 +1861,7 @@ enum emulation_result kvm_mips_emulate_store(union mips_instruction inst,
>  				  vcpu->arch.gprs[rt], *(u64 *)data);
>  			break;
>  		default:
> -			kvm_err("Godson Exteneded GS-Store not yet supported (inst=0x%08x)\n",
> +			kvm_err("Godson Extended GS-Store not yet supported (inst=0x%08x)\n",
>  				inst.word);
>  			break;
>  		}
> @@ -2103,7 +2103,7 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
>  			vcpu->mmio_needed = 30;	/* signed */
>  			break;
>  		default:
> -			kvm_err("Godson Exteneded GS-Load for float not yet supported (inst=0x%08x)\n",
> +			kvm_err("Godson Extended GS-Load for float not yet supported (inst=0x%08x)\n",
>  				inst.word);
>  			break;
>  		}
> 

Queued, thanks.

Paolo

