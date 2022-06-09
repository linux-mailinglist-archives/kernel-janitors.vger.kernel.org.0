Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 796C8544255
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Jun 2022 06:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236839AbiFIEJd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 Jun 2022 00:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235185AbiFIEJc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Jun 2022 00:09:32 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6FF4130E
        for <kernel-janitors@vger.kernel.org>; Wed,  8 Jun 2022 21:09:29 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id m26so19231798wrb.4
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jun 2022 21:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qr3m2Yddcj/9rkP9P1MqPdJ/Rr6E/RCde4JzQwq0ygk=;
        b=jjA7kaTwlPG+8lAJw8aS2qYkTELSRhTtioIkasP3Ua7Ncb8/Um8F1OEZyiGbMI6SeO
         ETd1KmKAR6a+w/PaNJyt8tzy4HP7ptThXmSP4ZLLdG/HPw9N535qzDqZ/aaVsB6mpgs4
         ekokUA+HBIacx6iBplvxFX5b4YM3ZxJ9X0ffgyTEb8LkEJlwYpfaYJOrYnc5ZaefX82u
         xXximfYvyQtlDROih7T+K0lvuvtzvkPaB9YyinAkRhhjbudH7UkKve6UtSpzaLWj3IEH
         PgmYE6GWpSDDrFh2H+0Anhh0sjG9TVGHn0ycyusXPfTXgQT5l5+hSgm3wUfg3mh0tas3
         xbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qr3m2Yddcj/9rkP9P1MqPdJ/Rr6E/RCde4JzQwq0ygk=;
        b=kCrf436GMb6ngqM+HILGv6gDdJcqcaCc3YtH/TAQhvTdbcRwSE5SrNxx7KLLDdRV8W
         fko05DMzmkr/iC2fajx0weq5lNF3OH9JL9WdegVsEM8/U0vJZwHIEgJmTjSiDI3rSVCD
         AD4z1RSdUJhL3jOZq+mXC8HI+IlNASXBqeBjHufJ3eHJdeozs+4nzRFsmEL5UBRURhXA
         eCk617jJXrTh+drJ744DRr3qDWzQC13S7/e7Ve1LV6C7cn/N87WmcDn8tfFPxXyubhho
         H3y+99g+fzMDsanYqaLNtp0X++vnbJTw0l+Hg4sLKUKVEmzgi8q6PU8dnm5TeghmlvoY
         M63w==
X-Gm-Message-State: AOAM532Ikf1aIc30MAjPKYyyHOKL6M5e3sR4pSwD7laLe2ByBuGrCQsT
        deDxyiodMKjHvKH9m2Brtg5cVMYWeJj9ecSjvKqn0SIXGos=
X-Google-Smtp-Source: ABdhPJzATZGYNXOEfNeC1xjFpQoXzH0chk3Mdxdc6eyXuvY61inSv66u7opI40j6F9/vdCRh2cJ/4vUkZLFYNZGRkY8=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr36664559wrz.690.1654747767939; Wed, 08
 Jun 2022 21:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220430191122.8667-6-Julia.Lawall@inria.fr>
In-Reply-To: <20220430191122.8667-6-Julia.Lawall@inria.fr>
From:   Anup Patel <anup@brainfault.org>
Date:   Thu, 9 Jun 2022 09:39:15 +0530
Message-ID: <CAAhSdy1kEPYJQdK+f-6Dkb92ScV9fG2m0J2rJSeWjfNFUtjVwA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: fix typos in comments
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        KVM General <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, May 1, 2022 at 12:41 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

I have included this patch for 5.19-rc fixes

Thanks,
Anup

>
> ---
>  arch/riscv/kvm/vmid.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> index 2fa4f7b1813d..4a2178c60b5d 100644
> --- a/arch/riscv/kvm/vmid.c
> +++ b/arch/riscv/kvm/vmid.c
> @@ -92,7 +92,7 @@ void kvm_riscv_stage2_vmid_update(struct kvm_vcpu *vcpu)
>                  * We ran out of VMIDs so we increment vmid_version and
>                  * start assigning VMIDs from 1.
>                  *
> -                * This also means existing VMIDs assignement to all Guest
> +                * This also means existing VMIDs assignment to all Guest
>                  * instances is invalid and we have force VMID re-assignement
>                  * for all Guest instances. The Guest instances that were not
>                  * running will automatically pick-up new VMIDs because will
>
