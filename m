Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C03B246747D
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 Dec 2021 11:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379703AbhLCKH2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 3 Dec 2021 05:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350895AbhLCKH1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Dec 2021 05:07:27 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B356C06173E
        for <kernel-janitors@vger.kernel.org>; Fri,  3 Dec 2021 02:04:04 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id x5so2471064pfr.0
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Dec 2021 02:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=esxAadU3+UzyTWgJKT1bUwFTK6KpmX9nIkgAaCqEFJ8=;
        b=hz5XXY/GT03NqQkdLQVEJ3g+yqdY16eU1ibWbwHKrFUJW/2X5ap9WkWm6gciAKj9y1
         kq27CayF8E4VQz4gNTKd4YagA4VRlwUBRlNXQnrvDAJLVqhk/QzYFkM7dKbwVcu1uEpg
         RcgYTp9jEUvdaB9b7OA1YQ6hO0jzojE5hucyLXOwUD4AaDJ90UfY/z4roYearsXGV+PD
         PP4P1e7qctmaK6uzsjlyf/kEFEskbm1JRHMg19CK++ciM761LumSQ1z6VrYUZVV1AEJY
         8lX7X5oIkSxZT3Yx3g8EuALMF3FI9yuACwxsp6FAw6P4oFNI+kH2CFSsdScd4pNRriEQ
         geDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=esxAadU3+UzyTWgJKT1bUwFTK6KpmX9nIkgAaCqEFJ8=;
        b=yndcNc95gJ4z62g3CRMIg8QNXbxMgbSK7YHkpqMCyhEdJuJh5ayngAQgXH3QBpWfHw
         wHzjgFDfZXu0Loxl+o90wdANWyNaCyFtZrhIcu5GT5ZnujhMBcvfvKDXd6vwmg5st7eR
         N2kIzQG9QzgiBEYI3zMm2trbrTp81DLXM0bejCEb07v7slBst/B4VG8rZLbM8ecRE5nz
         lrRgQe1YDMWGh9S6q7XlJtmZiZ/zSn7RiJkXyd2an922gz6qoR9BgPC/HBpn+vQ9SXCG
         WBbuDZM2KyZdlmL5FGKVOtoJ7s4f1S9NA72YTQSAMXNHVAgGl7FB/9QgJZHyjjbTtJ1G
         ocvQ==
X-Gm-Message-State: AOAM531Osc6/rMvx55QXZcp0fR/P7iD8KKT7RaO19O+VYtAyX4cct4EZ
        4bVxAcWVUwfANrj5TGZPSHrQ2GZjqcZufVhw8uM=
X-Google-Smtp-Source: ABdhPJw7AsWNlfH81iJLfMh8kHrFnT5+zRUtgVRv0/W+HyxV3lvM4nE14VyzG65ieDPR4/IudVElXAGxPo/4IvYDzGo=
X-Received: by 2002:a63:1b4b:: with SMTP id b11mr3854091pgm.322.1638525843781;
 Fri, 03 Dec 2021 02:04:03 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a20:a012:b0:5e:c616:72e0 with HTTP; Fri, 3 Dec 2021
 02:04:03 -0800 (PST)
Reply-To: jp2888322@gmail.com
From:   Maria-Elisabeth_Schaeffler <winfredmutulu84@gmail.com>
Date:   Fri, 3 Dec 2021 13:04:03 +0300
Message-ID: <CAK456Q+o7Y9-n_V6gFpLZRgPLeTSB7b1ncjK1cicexupo8Cofg@mail.gmail.com>
Subject: Re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--=20
Ich bin Maria Elisabeth Schaeffler, ich habe eine Spende f=C3=BCr Sie,
E-Mail f=C3=BCr weitere Informationen.

Gr=C3=BC=C3=9Fe
Maria-Elisabeth_Schaeffler
