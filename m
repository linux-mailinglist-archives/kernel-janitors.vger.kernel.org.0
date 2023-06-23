Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D13DE73C313
	for <lists+kernel-janitors@lfdr.de>; Fri, 23 Jun 2023 23:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbjFWVnY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 23 Jun 2023 17:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjFWVnK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Jun 2023 17:43:10 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5EB5135
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Jun 2023 14:43:08 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4007b5bafceso32331cf.1
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Jun 2023 14:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687556588; x=1690148588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKykNlOx+IYCcda+j3r4HjOXr8RTAPOM9+ozRi0gyU0=;
        b=qVR3YSLErh6dr+Vb1AW2l4ftjP/Z4eSmPCPM8Q59yk5s5BsNMzyRfXXJ2NxCrWiI0X
         dkPzCwqi3u1pdFXEfF5X6E7coC3rsdV7oICfd5bVHy4boenulW8oUI36No+kaGwjU9Xh
         4RbGRaFQ2QK4v3/i94/gpuKoxtTlmHg4ZwhKv97u3B9yDaMNrZjCd0QT0zSwGbqQuC0n
         j97VDTVMiy7HkTiYD+rv2kX5T26rP2XDMUm+eSgPhRlZt4IH7Xe0Q76v2Iad4cuy5qgq
         r1dEP8HPBig2LfrXd0mtktYQ27ko7xu3GzeZD30ESsSG8o09OFq/JZ0WTABrUfj9oDmE
         rloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687556588; x=1690148588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKykNlOx+IYCcda+j3r4HjOXr8RTAPOM9+ozRi0gyU0=;
        b=MEb9Hk5IoaJnZdRAqTfFx2CsO5mU51RT86x43XYFfpeeApvtbzvH0nWx8Cpw6HyDz4
         WGuIzT/yQvByhLKEQ/eeQlk67i/7PSjxDNYLdnohXXYtNKN/4RcrjgdTC5v6gLEnm8/A
         u8g1KMJRGdTdS/Y0aCMKH4pUFcI0SkQTWe7vGd9plP2++587B+SYjJgZx5vVo80OTXc5
         sNu00mRpcuPM60B8W/+rGZQFoszSFm87XKgx1wAFZdUq9ZJBfv9WM8TNhQ2R2cYct7Zg
         kd+hXJvq0Rxp1C5WQelpjSJCFLaPW6JfMwlUYqXwOUMWGxvijgqBuXomf2WVxOBYsRvk
         hgRQ==
X-Gm-Message-State: AC+VfDxEYDygETpsYS2CQ+8kZy4bSR8X1OxnuS1lEq8Rf9VlAKjEuh64
        3BiCKrqYXXSlNIbrDMVt6K63Zl3eCufI9YB4Cu5i
X-Google-Smtp-Source: ACHHUZ4poLvnSuV5cyybrW+VYzDvgGaHb87NRI6SmoHLs2JwOgyMJ4Txhi7tpMXi7olkf0B9pr7+6kAmVS3RPX/kjkQ=
X-Received: by 2002:a05:622a:353:b0:3f8:5b2:aef5 with SMTP id
 r19-20020a05622a035300b003f805b2aef5mr15887qtw.29.1687556587861; Fri, 23 Jun
 2023 14:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230623211457.102544-1-Julia.Lawall@inria.fr> <20230623211457.102544-7-Julia.Lawall@inria.fr>
In-Reply-To: <20230623211457.102544-7-Julia.Lawall@inria.fr>
From:   John Stultz <jstultz@google.com>
Date:   Fri, 23 Jun 2023 14:42:57 -0700
Message-ID: <CANDhNCpGy8UkUA8UdFZWYdJVEGG=kM_ws6Sy37dyUYFgk9uz5g@mail.gmail.com>
Subject: Re: [PATCH 06/26] dma-buf: system_heap: use array_size
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, keescook@chromium.org,
        kernel-janitors@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 23, 2023 at 2:15=E2=80=AFPM Julia Lawall <Julia.Lawall@inria.fr=
> wrote:
>
> Use array_size to protect against multiplication overflows.
>
> The changes were done using the following Coccinelle semantic patch:
>
> // <smpl>
> @@
>     size_t e1,e2;
>     expression COUNT;
>     identifier alloc =3D {vmalloc,vzalloc,kvmalloc,kvzalloc};
> @@
>
> (
>       alloc(
> -           (e1) * (e2)
> +           array_size(e1, e2)
>       ,...)
> |
>       alloc(
> -           (e1) * (COUNT)
> +           array_size(COUNT, e1)
>       ,...)
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Thanks for sending this out!

Acked-by: John Stultz <jstultz@google.com>
