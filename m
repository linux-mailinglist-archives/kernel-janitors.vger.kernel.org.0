Return-Path: <kernel-janitors+bounces-6211-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F80B9AEAF3
	for <lists+kernel-janitors@lfdr.de>; Thu, 24 Oct 2024 17:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09FB3B22712
	for <lists+kernel-janitors@lfdr.de>; Thu, 24 Oct 2024 15:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227F31F76C8;
	Thu, 24 Oct 2024 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpVqvIQb"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766E81F6676;
	Thu, 24 Oct 2024 15:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729784639; cv=none; b=Any8vIWqBXYSC3myaRJR6z6kiAbloa5ay4DdRdLEJLLfSOiYCb24ipbNhmw/iGbEcZydbc388zedSCnD7xc+33km/2uHedt9S7a5mbRwbQmUaMdj9lKNi60mwvilcUx9ab2Q28k7paIfjl7yt52BjZxXgUbUhpRjDrluE6jlkCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729784639; c=relaxed/simple;
	bh=49DttfIKQCHPgfjrhaS37EnWfxSeirs1B2D5isDzWug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HiVnBtw6WmDiMpP4YoqwliWYeFjb3mojzTmaDa5ERbaVuGzkyayyBzsRJ12jHCJb+WI3ABDs5I94a4ONEl7MIUQygkdmgxB49VvrA/t+DWt5ylQtuDeA5tHq05IhWxgg71xy6pRYLD996VzRTAuVcSf/C0GyugW/2MvvoZnamlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpVqvIQb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F252BC4CEC7;
	Thu, 24 Oct 2024 15:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729784639;
	bh=49DttfIKQCHPgfjrhaS37EnWfxSeirs1B2D5isDzWug=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jpVqvIQbD8yWcV9AZsFsZMtrrT21yYfDlolmhk0Efx3Y8rzUBOvsF19r5KgMca7ar
	 fuFLdiAjXmmy5EOprecJk5iDji1YJy6TgDqY3Wp4dNIwzro0tTfAB9RGo+GtCPq2VO
	 8IFqjNu1By8TbtVNPH3VEhaDUdLrfuspNX47LAwsP40lvTmlANBsslE9rGOO9H0M2i
	 m9bexudl9mNl1yztTnYllR/lAghBpUsezJPZt/8n27/FVjC1V6v25RzzVxy/TG9UX4
	 dBSlcv+1H+wSSg1Hs9sHyYOWaC8nEKzLYtu5ATS1y2zene+L3aAH93ryXaMs/q4AJB
	 aO+oXdL+3zXWA==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-288d70788d6so599626fac.1;
        Thu, 24 Oct 2024 08:43:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU24VXEdvCDHAgaOgkmwlwqHXshaVDFAEXONHGEU7PJLHWjwD5F6Sbtnb6uDK7/Tpa9vfZz235tk8IboQ==@vger.kernel.org, AJvYcCUgJwZ52KBjyqthrkP26Lanr0+UZlM/fWqHomipZ1OA+pThlkrB3TPQijrfz6CyD/mwiItYhPAT4X18x5qR@vger.kernel.org, AJvYcCWWNHyQ9ugrs66XKupzwefEGVRzZRdYx8HFMwZY+WI2dKjT8W3kPkZEDZVQHUSrEiNWppi/baLy7CYT6OVmwyc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw11rlT3T2q/cYDutTcHGnBLD9m9AkQsyTxg5y8uTn/C+U68mJw
	rCM5IlDANrxvldJISZhPkJZOMAfusOwECj7zVeb60TD3PHNRdm9HqaHaPSjNqaFBkdraOtSX7cC
	BqKySKb0u4vtz46yoQuuFAd06slM=
X-Google-Smtp-Source: AGHT+IHSUvErHQTpKpxRw8CFVNnKnDPL6Vq8IuMcUDPDqx3cJiQTbqjWEn2eiFYHfS+9cW+QrlQ/1Z9O3gRB/lvY4hI=
X-Received: by 2002:a05:6870:658b:b0:288:aee9:e739 with SMTP id
 586e51a60fabf-28ced13b467mr2478073fac.1.1729784638209; Thu, 24 Oct 2024
 08:43:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014130522.1986428-1-colin.i.king@gmail.com>
In-Reply-To: <20241014130522.1986428-1-colin.i.king@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 24 Oct 2024 17:43:46 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jjrm0C7+6o3+ZfsrFKedo_o42wErKTHMjfU5ZGBJ=Mbg@mail.gmail.com>
Message-ID: <CAJZ5v0jjrm0C7+6o3+ZfsrFKedo_o42wErKTHMjfU5ZGBJ=Mbg@mail.gmail.com>
Subject: Re: [PATCH][next] ACPI: pfr_telemetry: remove redundant error check
 on ret
To: Colin Ian King <colin.i.king@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 3:05=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> The variable ret is initialized to zero and a littler later in
> the PFRT_LOG_IOC_GET_INFO case of a switch statement is being checked
> for negative error value. Since ret has not been re-assigned since
> the initialization ret can never be less than zero so the check is
> redundant and can be removed. Remove it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/acpi/pfr_telemetry.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/acpi/pfr_telemetry.c b/drivers/acpi/pfr_telemetry.c
> index 998264a7333d..a32798787ed9 100644
> --- a/drivers/acpi/pfr_telemetry.c
> +++ b/drivers/acpi/pfr_telemetry.c
> @@ -272,9 +272,6 @@ static long pfrt_log_ioctl(struct file *file, unsigne=
d int cmd, unsigned long ar
>
>         case PFRT_LOG_IOC_GET_INFO:
>                 info.log_level =3D get_pfrt_log_level(pfrt_log_dev);
> -               if (ret < 0)
> -                       return ret;
> -
>                 info.log_type =3D pfrt_log_dev->info.log_type;
>                 info.log_revid =3D pfrt_log_dev->info.log_revid;
>                 if (copy_to_user(p, &info, sizeof(info)))
> --

Applied as 6.13 material, thanks!

